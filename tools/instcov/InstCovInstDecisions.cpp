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

extern llvm::cl::opt<bool> InstDecisions;

using namespace clang;
using namespace instcov;

namespace{
  std::string INSTCOV_FUNC_NAME = "instcov_dump";
  bool AskYesOrNo(const std::string &Prompt) {
    char c = 0;
    while (true) {
      llvm::errs() << Prompt << ". Yes or no (y/n)?";
      c = getchar();
      while (c == ' ' || c == '\t' || c == '\n') {
        c = getchar();
      }
      if (c == 'y') {
        return true;
      }
      if (c == 'n') {
        return false;
      }
    }
    return false;
  }
  
  SourceLocation findSemiAfterLocation(Rewriter &R, SourceLocation sl) {
    // llvm::errs() << "finding semicolon after location\n";
    SourceManager &SM = R.getSourceMgr();
    if (sl.isMacroID()) {
      // in a macro, return invalid
      llvm::errs() << "ERR: the given location is inside a macro\n";
      return SourceLocation();
    }
    sl = Lexer::getLocForEndOfToken(sl, 0, SM, R.getLangOpts());
    std::pair<FileID, unsigned> locInfo = SM.getDecomposedLoc(sl);

    // Try to load the file buffer
    bool invalidTemp = false;
    StringRef file = SM.getBufferData(locInfo.first, &invalidTemp);
    if (invalidTemp) {
      llvm::errs() << "ERR: cannot find the original location\n";
      return SourceLocation();
    }
    
    const char *tokenBegin = file.data() + locInfo.second;

    Lexer lexer(SM.getLocForStartOfFile(locInfo.first),
                R.getLangOpts(),
                file.begin(), tokenBegin, file.end());
    Token tok;
    lexer.LexFromRawLexer(tok);
    if (tok.isNot(tok::semi)) {
      llvm::errs() << "ERR: the next location is not a semicolon\n";
      return SourceLocation();
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
                        UUID uuid, uint64_t bid) {
    std::stringstream ss;
    ss << "\n" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", " << bid << ");";
    R.InsertTextAfter(s->getLBracLoc().getLocWithOffset(1), ss.str());
  }

  void InstSingleStmt(Stmt *s, Rewriter &R, UUID uuid, uint64_t bid) {
    std::stringstream ss;
    ss << "{\n" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", " << bid << ");\n";
    R.InsertTextAfter(s->getLocStart(), ss.str());
    R.InsertTextBefore(FindEndLoc(s, R), "\n}");
  }

  void InstInBlock(Stmt *s, Rewriter &R, UUID uuid, uint64_t bid) {
    if (isa<CompoundStmt>(s)) {
      InstCompoundStmt(cast<CompoundStmt>(s), R, uuid, bid);
    } else {
      InstSingleStmt(s, R, uuid, bid);
    }
  }

  void InstAfterBody(SourceLocation endLoc, Rewriter &R,
                     UUID uuid, uint64_t bid) {
    std::stringstream ss;
    ss << " \n " << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ", " << bid << ");";
    R.InsertTextBefore(endLoc, ss.str());
  }
}

bool InstCovASTVisitor::VisitIfStmt(IfStmt *s) {
  MCDCVisitIfStmt(s);
  if (!InstDecisions) {
    return true;
  }
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID uuid = DIM.getUUID(s);
  // Only care about If statements.
  IfStmt *IfStatement = cast<IfStmt>(s);
  Stmt *Then = IfStatement->getThen();

  Stmt *Else = IfStatement->getElse();
  if (Else) {
    InstInBlock(Else, TheRewriter, uuid, 0);
  } else {
    SourceLocation ThenBodyEndLoc = FindEndLoc(Then, TheRewriter);
    InstAfterBody(ThenBodyEndLoc, TheRewriter, uuid, 0);
    TheRewriter.InsertTextBefore(ThenBodyEndLoc, "else");
  }

  InstInBlock(Then, TheRewriter, uuid, 1);

  return true;
}

bool InstCovASTVisitor::VisitForStmt(ForStmt *s) {
  MCDCVisitForStmt(s);
  if (!InstDecisions) {
    return true;
  }
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID uuid = DIM.getUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, uuid, 0);
  InstInBlock(s->getBody(), TheRewriter, uuid, 1);
  return true;
}

bool InstCovASTVisitor::VisitWhileStmt(WhileStmt *s) {
  MCDCVisitWhileStmt(s);
  if (!InstDecisions) {
    return true;
  }
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID uuid = DIM.getUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, uuid, 0);
  InstInBlock(s->getBody(), TheRewriter, uuid, 1);
  return true;
}

bool InstCovASTVisitor::VisitDoStmt(DoStmt *s) {
  MCDCVisitDoStmt(s);
  if (!InstDecisions) {
    return true;
  }
  DIM.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  TheRewriter.InsertTextAfter(s->getCond()->getLocStart(), "(");
  UUID uuid = DIM.getUUID(s);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertTextBefore(s->getRParenLoc(), ss.str());
  return true;
}
