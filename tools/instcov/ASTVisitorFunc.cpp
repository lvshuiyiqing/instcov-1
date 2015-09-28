//===-- ASTVisitorFunc.cpp ---- FuncCov instrumentation ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for the
/// function coverage instrumentor
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include <cstdio>
#include "clang/Lex/Lexer.h"
#include "clang/Basic/Builtins.h"
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
#include "llvm/ADT/StringSet.h"
#include "ASTVisitorFunc.h"
#include "InstCovActions.h"
#include "CheckLocation.h"

using namespace clang;
using namespace llvm;
using namespace instcov;

namespace {
const std::string INSTCOV_FUNC_NAME = "instcov_func_dump";

void InstFunctionBody(
    CompoundStmt *s, Rewriter &R,
    UUID_t Uuid) {
  std::stringstream ss;
  ss << "\n  " << INSTCOV_FUNC_NAME << "(" << Uuid.toArgString() << ");";
  R.InsertText(s->getLBracLoc().getLocWithOffset(1), ss.str(), true, true);
}
}

ASTVisitorFunc::~ASTVisitorFunc(void) {
}

bool ASTVisitorFunc::VisitFunctionDecl(FunctionDecl *d) {
  if (!checkLocation(d, TheRewriter.getSourceMgr())) {
    return true;
  }
  if (!d->hasBody()) {
    return true;
  }
  clang::CompoundStmt *body = cast<CompoundStmt>(d->getBody());
  if (body == NULL) {
    return true;
  }
  DIB.registerFunc(d, TheRewriter.getSourceMgr());
  UUID_t Uuid = DIB.getFuncUUID(d);
  InstFunctionBody(body, TheRewriter, Uuid);
  return true;
}
