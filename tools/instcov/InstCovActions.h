//===-- InstCovActions.h ------- InstCovActions declaration -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for InstCovActions
/// \brief Each action wraps an ASTVisitor for doing specific instrumentations
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_INSTCOVACTIONS_H_
#define INSTCOV_INSTCOVACTIONS_H_

#include "clang/Rewrite/Core/Rewriter.h"
#include "clang/AST/AST.h"

namespace instcov {
class DbgInfoMgr;
class InstCovAction {
 public:
  InstCovAction(clang::Rewriter &R,
                clang::ASTContext &C,
                DbgInfoMgr &dim)
      : TheRewriter(R), TheASTContext(C), DIM(dim) {}
  virtual ~InstCovAction(void) {}
  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  DbgInfoMgr &DIM;

 public:
  virtual void VisitTranslationUnit(clang::TranslationUnitDecl *D) = 0;
  static InstCovAction *CreateAction(
      const std::string &actionName,
      clang::Rewriter &R,
      clang::ASTContext &C,
      DbgInfoMgr &dim);
};
}

#endif  // INSTCOV_INSTCOVACTIONS_H_
