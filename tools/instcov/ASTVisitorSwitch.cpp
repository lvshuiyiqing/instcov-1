//===-- ASTVisitorSwitch.cpp ---- SwitchCov instrumentation -----*- C++ -*-===//
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
/// switch statement coverage instrumentor
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
#include "ASTVisitorSwitch.h"
#include "InstCovActions.h"
#include "CheckLocation.h"

using namespace clang;
using namespace llvm;
using namespace instcov;

namespace {
const std::string INSTCOV_FUNC_NAME = "instcov_switch_dump";
}

ASTVisitorSwitch::~ASTVisitorSwitch(void) {
}

bool ASTVisitorSwitch::VisitSwitchStmt(SwitchStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  std::stringstream header_ss;
  DIB.registerSwitch(s, TheRewriter.getSourceMgr());
  UUID_t Uuid = DIB.getSwitchUUID(s);
  // BUG FIX: added a ";" before the VarDecl so that this will be legal after
  // a goto label
  header_ss << ";int instcov_sf" << Uuid.toString() << " = 1;\n";
  TheRewriter.InsertText(s->getLocStart(), header_ss.str(), true, true);
  SwitchCase *SC = s->getSwitchCaseList();
  uint64_t bid = 0;
  while (SC) {
    if (!isa<CaseStmt>(SC->getSubStmt())) {
      std::stringstream ss;
      ss.clear();
      ss << "if (instcov_sf" << Uuid.toString() << " == 1) {\n"
         << "  "
         << INSTCOV_FUNC_NAME
         << "(" << Uuid.toArgString() << ", " << bid++ << ");\n"
         << "  instcov_sf" << Uuid.toString() << " = 0;\n"
         << "}\n";
      TheRewriter.InsertText(SC->getSubStmt()->getLocStart(), ss.str(),
                             true, true);
    }
    SC = SC->getNextSwitchCase();
  }
  return true;
}
