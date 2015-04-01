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
  void InstCompoundStmt(CompoundStmt *s, Rewriter &R,
                        uint64_t id, uint64_t bid) {
    std::stringstream ss;
    ss << "Dump(" << id << ", " << bid << ");\n";
    R.InsertText(s->getLBracLoc().getLocWithOffset(1), ss.str(), true, true);
  }

  void InstSingleStmt(Stmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    R.InsertText(s->getLocStart(), "{\n", 0, 0);
    std::stringstream ss;
    ss << "\nDump(" << id << ", " << bid << ");\n}\n";
    R.InsertText(s->getLocEnd(), ss.str(), true, true);
  }

  void InstInBlock(Stmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    if (isa<CompoundStmt>(s)) {
      InstCompoundStmt(cast<CompoundStmt>(s), R, id, bid);
    } else {
      InstSingleStmt(s, R, id, bid);
    }
  }

  void InstElseBlock(IfStmt *s, Rewriter &R, uint64_t id, uint64_t bid) {
    std::stringstream ss;
    ss << " else\n Dump(" << id << ", " << bid << ");\n";
    R.InsertText(s->getLocEnd().getLocWithOffset(1), ss.str(), true, true);
  }
  
  void InstExpr(Expr *e, Rewriter &R, uint64_t id, uint64_t bid) {
  }

}

bool InstCovASTVisitor::VisitIfStmt(IfStmt *s) {
  // Only care about If statements.
  llvm::errs() << "Instrumenting IfStmt\n";
  IfStmt *IfStatement = cast<IfStmt>(s);
  Stmt *Then = IfStatement->getThen();

  InstInBlock(Then, TheRewriter, 0, 0);

  Stmt *Else = IfStatement->getElse();
  if (Else) {
    InstInBlock(Else, TheRewriter, 0, 1);
  } else {
    InstElseBlock(s, TheRewriter, 0, 1);
  }

  return true;
}
