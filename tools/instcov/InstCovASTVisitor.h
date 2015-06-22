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
#include "DIBuilder4Inst.h"

namespace instcov{
class InstCovASTVisitor : public clang::RecursiveASTVisitor<InstCovASTVisitor> {
public:
  InstCovASTVisitor(clang::Rewriter &R, clang::ASTContext &C)
      : TheRewriter(R), TheASTContext(C),
        DIB() {}
  ~InstCovASTVisitor(void);
  
  bool VisitIfStmt(clang::IfStmt *s);
  bool VisitForStmt(clang::ForStmt *s);
  bool VisitWhileStmt(clang::WhileStmt *s);
  bool VisitDoStmt(clang::DoStmt *s);
  bool VisitSwitchStmt(clang::SwitchStmt *s);
  bool VisitBinaryOperator(clang::BinaryOperator *s);
  bool VisitDeclStmt(clang::DeclStmt *s);
  bool VisitReturnStmt(clang::ReturnStmt *s);
  // don't rewrite visit functions for sub-classes
  bool VisitAbstractConditionalOperator(clang::AbstractConditionalOperator *s);
  
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
  // skip all top-level implicit casts and find the root expr
  static clang::Expr *toRHSRoot(clang::Expr *e);

  static std::vector<clang::Expr *> extractConditions(clang::Expr *e);

  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  DIBuilder4Inst DIB;
  std::set<const clang::DeclStmt *> VisitedDecls;
};
}

#endif  // INSTCOV_ASTVISITOR_H_
