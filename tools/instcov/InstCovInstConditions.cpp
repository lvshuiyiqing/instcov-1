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
using namespace llvm;
using namespace clang;
using namespace instcov;

extern llvm::cl::OptionCategory InstCovCategory;

cl::opt<bool> InstConditions(
    "inst-conditions",
    cl::desc("enable condition instrumentation for MC/DC.\n"
             "The instrumentation may change the program behavior\n"
             "if the conditions have side-effects"
             "Default value: false"),
    cl::cat(InstCovCategory),
    cl::init(false));

namespace {

std::vector<Expr *> ExtractMCDCLeaves(Expr *e, ASTContext &C) {
  std::vector<Expr *> Leaves;
  std::stack<Expr *> UncheckedNodes;
  UncheckedNodes.push(e);
  while(!UncheckedNodes.empty()) {
    Expr *Node = UncheckedNodes.top();
    UncheckedNodes.pop();
    if (BinaryOperator *bo = dyn_cast<BinaryOperator>(Node)) {
      if (bo->isLogicalOp()) {
        UncheckedNodes.push(bo->getRHS());
        UncheckedNodes.push(bo->getLHS());
        continue;
      }
    }
    if (UnaryOperator *uo = dyn_cast<UnaryOperator>(Node)) {
      if (uo->getOpcode() == UO_LNot) {
        UncheckedNodes.push(uo->getSubExpr());
        continue;
      }
    }
    if (ParenExpr *pe = dyn_cast<ParenExpr>(Node)) {
      UncheckedNodes.push(pe->getSubExpr());
      continue;
    }
    // leaf nodes
    Leaves.push_back(Node);
    continue;
  }
  return Leaves;
}
}

void InstCovASTVisitor::MCDCVisitExpr(Expr *e, Stmt *p) {
  TheRewriter.InsertText(e->getLocStart(), "(", true, true);
  std::vector<Expr *> CondExprs = ExtractMCDCLeaves(
      e, TheASTContext);
  for (auto it = CondExprs.begin(), ie = CondExprs.end();
       it != ie; ++it) {
    DIM.registerStmt(*it, p, TheRewriter.getSourceMgr());
    UUID_t uuid = DIM.getUUID(*it);
    std::string dumper;
    llvm::raw_string_ostream os(dumper);
    os << "instcov_dump(" << uuid.toArgString() << ", (";
    (*it)->printPretty(os, nullptr,
                       PrintingPolicy(TheASTContext.getLangOpts()));
    os << ") ? 1 : 0), ";
    os.flush();
    TheRewriter.InsertText(e->getLocStart(), dumper, true, true);
  }
  SourceLocation endLoc = Lexer::getLocForEndOfToken(
      e->getLocEnd(), 0, TheRewriter.getSourceMgr(),
      TheRewriter.getLangOpts());
  TheRewriter.InsertText(endLoc, ")", false, true);
}

void InstCovASTVisitor::MCDCVisitIfStmt(IfStmt *s) {
  if (!InstConditions) {
    return;
  }
  Expr *Expr4Instr = s->getCond();
  if (s->getConditionVariable()) {
    Expr4Instr = s->getConditionVariable()->getInit();
  }
  MCDCVisitExpr(Expr4Instr, s);
}

void InstCovASTVisitor::MCDCVisitForStmt(ForStmt *s) {
  if (!InstConditions) {
    return;
  }
  if (s->getCond()) {
    MCDCVisitExpr(s->getCond(), s);
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
  MCDCVisitExpr(Expr4Instr, s);
}

void InstCovASTVisitor::MCDCVisitDoStmt(DoStmt *s) {
  if (!InstConditions) {
    return;
  }
  MCDCVisitExpr(s->getCond(), s);
}
