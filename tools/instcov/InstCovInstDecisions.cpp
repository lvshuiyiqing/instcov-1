//===-- InstCovInstDecisions.cpp --- decision instrumentation ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for decision
/// instrumentation functions in InstcovASTVisitor
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include <cstdio>
#include "clang/Lex/Lexer.h"
#include "clang/AST/AST.h"
#include "clang/AST/ASTConsumer.h"
#include "clang/AST/RecursiveASTVisitor.h"
#include "clang/Frontend/ASTConsumers.h"
#include "clang/Frontend/FrontendActions.h"
#include "clang/Frontend/CompilerInstance.h"
#include "clang/Tooling/CommonOptionsParser.h"
#include "clang/Tooling/Tooling.h"
#include "clang/Rewrite/Core/Rewriter.h"
#include "llvm/Support/raw_ostream.h"
#include "instcov/InstCovASTVisitor.h"
#include "instcov/uuid.h"

using namespace llvm;
using namespace clang;
using namespace instcov;

extern llvm::cl::OptionCategory InstCovCategory;

cl::opt<bool> InstSwitch(
    "inst-switch",
    cl::desc("enable switch instrumentation.\n"
             "Default value: false\n"),
    cl::cat(InstCovCategory),
    cl::init(false));

namespace{
  std::string INSTCOV_FUNC_NAME = "instcov_dump";

  SourceLocation findSemiAfterLocation(Rewriter &R, SourceLocation sl) {
    // llvm::errs() << "finding semicolon after location\n";
    SourceManager &SM = R.getSourceMgr();
    if (sl.isMacroID()) {
      // in a macro, return invalid
      SM.getDiagnostics().Report(sl, diag::err_mt_message)
          << "ERR: the given location is inside a macro\n";
      exit(1);
    }
    sl = Lexer::getLocForEndOfToken(sl, 0, SM, R.getLangOpts());
    std::pair<FileID, unsigned> locInfo = SM.getDecomposedLoc(sl);

    // Try to load the file buffer
    bool invalidTemp = false;
    StringRef file = SM.getBufferData(locInfo.first, &invalidTemp);
    if (invalidTemp) {
      SM.getDiagnostics().Report(sl, diag::err_mt_message)
          << "ERR: cannot find the original location\n";
      exit(1);
    }
    
    const char *tokenBegin = file.data() + locInfo.second;

    Lexer lexer(SM.getLocForStartOfFile(locInfo.first),
                R.getLangOpts(),
                file.begin(), tokenBegin, file.end());
    Token tok;
    lexer.LexFromRawLexer(tok);
    if (tok.isNot(tok::semi)) {
      SM.getDiagnostics().Report(sl, diag::err_mt_message)
          << "ERR: the next location is not a semicolon\n";
      exit(1);
    }
    // llvm::errs() << "SUCCESS: semicolon found\n";
    return tok.getLocation();
  }


  SourceLocation FindEndLoc(Stmt *s, Rewriter &R) {
    SourceManager &SM = R.getSourceMgr();
    SourceLocation EndSL = s->getLocEnd();
    char TailChar = *SM.getCharacterData(EndSL);
    if (TailChar == '}' || TailChar == ';') {
      return EndSL.getLocWithOffset(1);
    }
    return findSemiAfterLocation(R, EndSL).getLocWithOffset(1);
  }
  
  void InstCompoundStmt(CompoundStmt *s, Rewriter &R,
                        UUID_t uuid, uint64_t bid) {
    std::stringstream ss;
    ss << "\n" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", "
       << bid << ");";
    R.InsertText(s->getLBracLoc().getLocWithOffset(1), ss.str(), true, true);
  }

  void InstSingleStmt(Stmt *s, Rewriter &R, UUID_t uuid, uint64_t bid) {
    std::stringstream ss;
    ss << "{\n" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", "
       << bid << ");\n";
    R.InsertText(s->getLocStart(), ss.str(), true, true);
    R.InsertText(FindEndLoc(s, R), "\n}", false, true);
  }

  void InstInBlock(Stmt *s, Rewriter &R, UUID_t uuid, uint64_t bid) {
    if (isa<CompoundStmt>(s)) {
      InstCompoundStmt(cast<CompoundStmt>(s), R, uuid, bid);
    } else {
      InstSingleStmt(s, R, uuid, bid);
    }
  }

  void InstAfterBody(SourceLocation endLoc, Rewriter &R,
                     UUID_t uuid, uint64_t bid) {
    std::stringstream ss;
    ss << " \n " << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", "
       << bid << ");";
    R.InsertText(endLoc, ss.str(), false, true);
  }
}

bool InstCovASTVisitor::IsInMain(Stmt *s) const {
  SourceManager &SM = TheRewriter.getSourceMgr();
  if (SM.getFileID(s->getLocStart()) == SM.getMainFileID()) {
    return true;
  }
  return false;
}

bool InstCovASTVisitor::VisitIfStmt(IfStmt *s) {
  if (!IsInMain(s)) {
    return true;
  }
  MCDCVisitIfStmt(s);
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIM.getUUID(s);
  // Only care about If statements.
  IfStmt *IfStatement = cast<IfStmt>(s);
  Stmt *Then = IfStatement->getThen();

  Stmt *Else = IfStatement->getElse();
  if (Else) {
    InstInBlock(Else, TheRewriter, uuid, 0);
  } else {
    SourceLocation ThenBodyEndLoc = FindEndLoc(Then, TheRewriter);
    InstAfterBody(ThenBodyEndLoc, TheRewriter, uuid, 0);
    TheRewriter.InsertText(ThenBodyEndLoc, "else", false, true);
  }

  InstInBlock(Then, TheRewriter, uuid, 1);

  return true;
}

bool InstCovASTVisitor::VisitForStmt(ForStmt *s) {
  if (!IsInMain(s)) {
    return true;
  }
  MCDCVisitForStmt(s);
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIM.getUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, uuid, 0);
  InstInBlock(s->getBody(), TheRewriter, uuid, 1);
  return true;
}

bool InstCovASTVisitor::VisitWhileStmt(WhileStmt *s) {
  if (!IsInMain(s)) {
    return true;
  }
  MCDCVisitWhileStmt(s);
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIM.getUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, uuid, 0);
  InstInBlock(s->getBody(), TheRewriter, uuid, 1);
  return true;
}

bool InstCovASTVisitor::VisitDoStmt(DoStmt *s) {
  if (!IsInMain(s)) {
    return true;
  }
  MCDCVisitDoStmt(s);
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  TheRewriter.InsertText(s->getCond()->getLocStart(), "(", true, true);
  UUID_t uuid = DIM.getUUID(s);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertText(s->getRParenLoc(), ss.str(), false, true);
  return true;
}

bool InstCovASTVisitor::VisitSwitchStmt(SwitchStmt *s) {
  if (!IsInMain(s)) {
    return true;
  }
  if (!InstSwitch) {
    return true;
  }
  std::stringstream header_ss;
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t Uuid = DIM.getUUID(s);
  header_ss << "int instcov_f" << Uuid.toString() << " = 1;\n";
  TheRewriter.InsertText(s->getLocStart(), header_ss.str(), true, true);
  SwitchCase *SC = s->getSwitchCaseList();
  uint64_t bid = 2;
  while (SC) {
    if (!isa<CaseStmt>(SC->getSubStmt())) {
      std::stringstream ss;
      ss.clear();
      ss << "if (instcov_f" << Uuid.toString() << " == 1) {\n"
         << "  instcov_dump(" << Uuid.toArgString() << ", " << bid++ << ");\n"
         << "  instcov_f" << Uuid.toString() << " = 0;\n"
         << "}\n";
      TheRewriter.InsertText(SC->getSubStmt()->getLocStart(), ss.str(),
                             true, true);
    }
    SC = SC->getNextSwitchCase();
  }
  return true;
}

