//===-- InstCovInstConditions.cpp -- condition instrumentation --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for condition
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
#include "instcov/InstCovASTVisitor.h"
#include <vector>
#include <stack>

extern llvm::cl::opt<bool> InstConditions;

using namespace clang;
using namespace instcov;

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

void InstCovASTVisitor::MCDCVisitExpr(Expr *e, Stmt *p) {
  TheRewriter.InsertTextAfter(e->getLocStart(), "(");
  std::vector<Expr *> CondExprs = ExtractMCDCLeaves(
      e, TheASTContext);
  for (auto it = CondExprs.begin(), ie = CondExprs.end();
       it != ie; ++it) {
    DIM.registerStmt(*it, p);
    UUID uuid = DIM.getUUID(*it);
    std::string dumper;
    llvm::raw_string_ostream os(dumper);
    os << "instcov_dump(" << uuid.toArgString() << ", (";
    (*it)->printPretty(os, nullptr,
                       PrintingPolicy(TheASTContext.getLangOpts()));
    os << ") ? 0 : 1), ";
    os.flush();
    TheRewriter.InsertTextAfter(e->getLocStart(), dumper);
  }
  SourceLocation endLoc = Lexer::getLocForEndOfToken(
      e->getLocEnd(), 0, TheRewriter.getSourceMgr(),
      TheRewriter.getLangOpts());
  TheRewriter.InsertTextBefore(endLoc, ")");
}

void InstCovASTVisitor::MCDCVisitIfStmt(IfStmt *s) {
  if (!InstConditions) {
    return;
  }
  Expr *Expr4Instr = s->getCond();
  if (s->getConditionVariable()) {
    Expr4Instr = s->getConditionVariable()->getInit();
  }
  MCDCVisitExpr(Expr4Instr);
}

void InstCovASTVisitor::MCDCVisitForStmt(ForStmt *s) {
  if (!InstConditions) {
    return;
  }
  if (s->getCond()) {
    MCDCVisitExpr(s->getCond());
  }
}

void InstCovASTVisitor::MCDCVisitWhileStmt(WhileStmt *s) {
  if (!InstConditions) {
    return;
  }
  Expr *Expr4Instr = s->getCond();
  if (s->getConditionVariable()) {
    Expr4Instr = s->getConditionVariable()->getInit();
  }
  MCDCVisitExpr(Expr4Instr);
}

void InstCovASTVisitor::MCDCVisitDoStmt(DoStmt *s) {
  if (!InstConditions) {
    return;
  }
  MCDCVisitExpr(s->getCond());
}
