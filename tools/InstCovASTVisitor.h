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

class InstCovASTVisitor : public clang::RecursiveASTVisitor<InstCovASTVisitor> {
public:
  InstCovASTVisitor(clang::Rewriter &R, clang::ASTContext &C)
      : TheRewriter(R), TheASTContext(C) {}

  bool VisitIfStmt(clang::IfStmt *s);
  bool VisitForStmt(clang::ForStmt *s);
  bool VisitWhileStmt(clang::WhileStmt *s);
  bool VisitDoStmt(clang::DoStmt *s);

  void MCDCVisitIfStmt(clang::IfStmt *s);
  void MCDCVisitForStmt(clang::ForStmt *s);
  void MCDCVisitWhileStmt(clang::WhileStmt *s);
  void MCDCVisitDoStmt(clang::DoStmt *s);

private:
  bool MCDCVisitExpr(clang::Expr *e);

  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
};

