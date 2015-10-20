//===-- ASTVisitorSwitch.h ---- ASTVisitorSwitch declaration ----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for ASTVisitorSwitch,
/// \brief which instruments the switch coverage analysis
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_ASTVISITORSWITCH_H_
#define INSTCOV_ASTVISITORSWITCH_H_

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
#include "InstDIBuilderSwitch.h"

namespace instcov {
class ASTVisitorSwitch : public clang::RecursiveASTVisitor<ASTVisitorSwitch> {
 public:
  typedef clang::RecursiveASTVisitor<ASTVisitorSwitch> base_t;

  ASTVisitorSwitch(clang::Rewriter &R,
                   clang::ASTContext &C,
                   instcov::DbgInfoMgr &DIM)
      : TheRewriter(R), TheASTContext(C),
        DIB(DIM) {
  }
  ~ASTVisitorSwitch(void);

  bool VisitSwitchStmt(clang::SwitchStmt *d);

 private:
  clang::Rewriter &TheRewriter;
  clang::ASTContext &TheASTContext;
  instcov::InstDIBuilderSwitch DIB;
};
}

#endif  // INSTCOV_ASTVISITORSWITCH_H_
