//===-- InstCovInstExpr.cpp --- InstCov expr instrumentation ===-*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for expr
/// instrumentation functions in InstcovASTVisitor
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include <cstdio>
#include "clang/Lex/Lexer.h"
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
#include <vector>
#include <stack>

extern llvm::cl::opt<bool> InstExprs;

using namespace clang;

namespace {
enum EXPR_TYPE {
  EXPR_UNSUPPORTED,
  EXPR_LEAF,
  EXPR_NONLEAF,    
};

EXPR_TYPE MCDCNodeType(const Expr *e) {
  if (const BinaryOperator *bo = dyn_cast<BinaryOperator>(e)) {
      if (bo->isLogicalOp()) {
        return EXPR_NONLEAF;
      }
      return EXPR_LEAF;
  }
  if (const UnaryOperator *uo = dyn_cast<UnaryOperator>(e)) {
      if (uo->getOpcode() == UO_LNot) {
        return EXPR_NONLEAF;
      }
      return EXPR_LEAF;
  }
  return EXPR_LEAF;
}

std::vector<Expr *> ExtractMCDCLeaves(Expr *e, ASTContext &C) {
  std::vector<Expr *> Leaves;
  std::stack<Expr *> UncheckedNodes;
  UncheckedNodes.push(e);
  while(!UncheckedNodes.empty()) {
    Expr *Node = UncheckedNodes.top();
    UncheckedNodes.pop();
    if (MCDCNodeType(Node) == EXPR_UNSUPPORTED) {
      llvm::errs() << "unsupported node: ";
      Node->dumpPretty(C);
      llvm::errs() << "\n";
    }
    if (MCDCNodeType(Node) == EXPR_LEAF) {
      Leaves.push_back(Node);
      continue;
    }
    if (BinaryOperator *bo = dyn_cast<BinaryOperator>(Node)) {
      UncheckedNodes.push(bo->getRHS());
      UncheckedNodes.push(bo->getLHS());
      continue;
    }
    if (UnaryOperator *uo = dyn_cast<UnaryOperator>(Node)) {
      UncheckedNodes.push(uo->getSubExpr());
      continue;
    }
    llvm::errs() << "unhandled expression: ";
    Node->dumpPretty(C);
    llvm::errs() << "\n";
  }
  return Leaves;
}
}

bool InstCovASTVisitor::MCDCVisitExpr(Expr *e) {
  std::vector<Expr*> leaves = ExtractMCDCLeaves(e, TheASTContext);
  for (auto it = leaves.begin(); it != leaves.end(); ++it) {
    (*it)->dumpPretty(TheASTContext);
    llvm::errs() << "\n";
  }
  return true;
}

void InstCovASTVisitor::MCDCVisitIfStmt(IfStmt *s) {
  std::vector<Expr *> CondExprs = ExtractMCDCLeaves(
      s->getCond(), TheASTContext);
  for (auto it = CondExprs.begin(), ie = CondExprs.end();
       it != ie; ++it) {
    std::string line;
    llvm::raw_string_ostream os(line);
    os << "Dump(0, (";
    (*it)->printPretty(os, nullptr,
                       PrintingPolicy(TheASTContext.getLangOpts()));
    os << ") ? 0 : 1);\n";
    os.flush();
    TheRewriter.InsertTextAfter(s->getLocStart(), line);
  }
}

void InstCovASTVisitor::MCDCVisitForStmt(ForStmt *s) {
}

void InstCovASTVisitor::MCDCVisitWhileStmt(WhileStmt *s) {
}

void InstCovASTVisitor::MCDCVisitDoStmt(DoStmt *s) {
}

