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

  bool visitIfStmt(clang::IfStmt *s);
  bool visitForStmt(clang::ForStmt *s);
  bool visitWhileStmt(clang::WhileStmt *s);
  bool visitDoStmt(clang::DoStmt *s);
  bool visitSwitchStmt(clang::SwitchStmt *s);
  bool visitBinaryOperator(clang::BinaryOperator *s);
  //bool visitDeclStmt(clang::DeclStmt *s);

  // insert decision & conditions for assignment operators and normal VarDecls
  void handleRHS4Assgn_NormalVarDecl(clang::Expr *e);
  
  void MCDCVisitIfStmt(clang::IfStmt *s);
  void MCDCVisitForStmt(clang::ForStmt *s);
  void MCDCVisitWhileStmt(clang::WhileStmt *s);
  void MCDCVisitDoStmt(clang::DoStmt *s);
  void MCDCVisitBinaryOperator(clang::BinaryOperator *s);

private:
  bool checkLocation(clang::Stmt *s) const;
  void MCDCVisitExpr(clang::Expr *e, clang::Stmt *p = 0);

  static bool isSimpleRHS(clang::Expr *e);
  static clang::Expr *toRHSRoot(clang::Expr *e);

  static std::vector<clang::Expr *> extractConditions(clang::Expr *e);

  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  DbgInfoMgr DIM;
  std::set<const clang::DeclStmt *> VisitedDecls;
};
}

#endif  // INSTCOV_ASTVISITOR_H_
