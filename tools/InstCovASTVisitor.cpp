//===-- InstCovASTVisitor.cpp --- InstCovASTVisitor declaration -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for InstcovASTVisitor
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
#include "InstCovASTVisitor.h"

using namespace clang;

namespace{

  bool AskYesOrNo(const std::string &Prompt) {
    char c = 0;
    while (true) {
      llvm::errs() << Prompt << ". Yes or no (y/n)?";
      c = getchar();
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
    llvm::errs() << "finding semicolon after location\n";
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
    llvm::errs() << "SUCCESS: semicolon found\n";
    return tok.getLocation();
  }


  SourceLocation FindEndLoc(Stmt *s, Rewriter &R) {
    SourceManager &SM = R.getSourceMgr();
    SourceLocation EndSL = s->getLocEnd();
    char TailChar = *SM.getCharacterData(EndSL);
    if (TailChar == '}') {
      return EndSL.getLocWithOffset(1);
    }
    return findSemiAfterLocation(R, EndSL).getLocWithOffset(1);
  }
  
  void InstCompoundStmt(CompoundStmt *s, Rewriter &R,
                        uint64_t id, uint64_t bid) {
    std::stringstream ss;
    ss << "\nDump(" << id << ", " << bid << ");\n";
    R.InsertText(s->getLBracLoc().getLocWithOffset(1), ss.str(), true, true);
  }

  void InstSingleStmt(Stmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    std::stringstream ss;
    ss << "{\nDump(" << id << ", " << bid << ");\n";
    R.InsertText(s->getLocStart(), ss.str(), 0, 0);
    R.InsertText(FindEndLoc(s, R), "\n}\n", true, true);
  }

  void InstInBlock(Stmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    if (isa<CompoundStmt>(s)) {
      InstCompoundStmt(cast<CompoundStmt>(s), R, id, bid);
    } else {
      InstSingleStmt(s, R, id, bid);
    }
  }

  void InstNewElseBlock(IfStmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    std::stringstream ss;
    ss << " else\n Dump(" << id << ", " << bid << ");\n";
    R.InsertText(FindEndLoc(s, R), ss.str(), true, true);
  }
  
  void InstExpr(Expr *e, Rewriter &R, uint64_t id, uint64_t bid) {
  }

}

bool InstCovASTVisitor::VisitIfStmt(IfStmt *s) {
  if (!AskYesOrNo("instrument here")) {
    return true;
  }
  // Only care about If statements.
  llvm::errs() << "Instrumenting IfStmt\n";
  IfStmt *IfStatement = cast<IfStmt>(s);
  Stmt *Then = IfStatement->getThen();


  Stmt *Else = IfStatement->getElse();
  if (Else) {
    InstInBlock(Else, TheRewriter, 0, 1);
  } else {
    InstNewElseBlock(s, TheRewriter, 0, 1);
  }

  InstInBlock(Then, TheRewriter, 0, 0);

  return true;
}
