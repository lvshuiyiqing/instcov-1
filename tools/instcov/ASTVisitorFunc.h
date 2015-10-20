//===-- ASTVisitorFunc.h ------ ASTVisitorFunc declaration ------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for ASTVisitorFunc,
/// \brief which instruments for function coverage analysis
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_ASTVISITORFUNC_H_
#define INSTCOV_ASTVISITORFUNC_H_

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
#include "InstDIBuilderFunc.h"

namespace instcov {
class ASTVisitorFunc : public clang::RecursiveASTVisitor<ASTVisitorFunc> {
 public:
  typedef clang::RecursiveASTVisitor<ASTVisitorFunc> base_t;

  ASTVisitorFunc(clang::Rewriter &R,
                 clang::ASTContext &C,
                 instcov::DbgInfoMgr &DIM)
      : TheRewriter(R), TheASTContext(C),
        DIB(DIM) {
  }
  ~ASTVisitorFunc(void);

  bool VisitFunctionDecl(clang::FunctionDecl *d);

 private:
  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  instcov::InstDIBuilderFunc DIB;
};
}

#endif  // INSTCOV_ASTVISITORFUNC_H_
