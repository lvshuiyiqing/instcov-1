//===-- InstCovASTVisitor.h --- InstCovASTVisitor declaration ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for InstcovASTVisitor
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_ASTVISITOR_H_
#define INSTCOV_ASTVISITOR_H_

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
#include "instcov/DbgInfoMgr.h"

namespace instcov{
class InstCovASTVisitor : public clang::RecursiveASTVisitor<InstCovASTVisitor> {
public:
  InstCovASTVisitor(clang::Rewriter &R, clang::ASTContext &C)
      : TheRewriter(R), TheASTContext(C),
        DIM(R.getSourceMgr().getFileEntryForID(
            R.getSourceMgr().getMainFileID())->getName()) {}

  bool VisitIfStmt(clang::IfStmt *s);
  bool VisitForStmt(clang::ForStmt *s);
  bool VisitWhileStmt(clang::WhileStmt *s);
  bool VisitDoStmt(clang::DoStmt *s);
  bool VisitSwitchStmt(clang::SwitchStmt *s);

  void MCDCVisitIfStmt(clang::IfStmt *s);
  void MCDCVisitForStmt(clang::ForStmt *s);
  void MCDCVisitWhileStmt(clang::WhileStmt *s);
  void MCDCVisitDoStmt(clang::DoStmt *s);

private:
  void MCDCVisitExpr(clang::Expr *e, clang::Stmt *p);

  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  DbgInfoMgr DIM;
};
}

#endif  // INSTCOV_ASTVISITOR_H_
