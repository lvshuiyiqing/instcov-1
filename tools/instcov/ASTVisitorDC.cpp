//===-- ASTVisitorDC.cpp ---------- D/C instrumentation ---------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for decision/condition
/// instrumentation functions in ASTVisitorDC
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
#include "ASTVisitorDC.h"
#include "InstCovActions.h"
#include "CheckLocation.h"

using namespace llvm;
using namespace clang;
using namespace instcov;

extern llvm::cl::OptionCategory InstCovCategory;

cl::opt<bool> InstRHS(
    "inst-RHS",
    cl::desc("enable RHS value instrumentation,\n"
             "including assignment operator, VarDecls and return statements\n"
             "Default value: false\n"),
    cl::cat(InstCovCategory),
    cl::init(false));


cl::opt<bool> InstConditions(
    "inst-conditions",
    cl::desc("enable condition instrumentation for MC/DC.\n"
             "The instrumentation may change the program behavior\n"
             "if the conditions have side-effects"
             "Default value: false"),
    cl::cat(InstCovCategory),
    cl::init(false));

namespace {
const std::string INSTCOV_FUNC_NAME = "instcov_dc_dump";


/**
 * This function is taken from Clang Transform.cpp
 */
SourceLocation findSemiAfterLocation(Rewriter &R, SourceLocation sl) {
  // llvm::errs() << "finding semicolon after location\n";
  SourceManager &SM = R.getSourceMgr();
  if (sl.isMacroID()) {
    // in a macro, return invalid
    SM.getDiagnostics().Report(sl, diag::err_mt_message)
        << "ERR: the given location is inside a macro\n";
    exit(1);
  }
  sl = Lexer::getLocForEndOfToken(sl, 0, SM, R.getLangOpts());
  std::pair<FileID, unsigned> locInfo = SM.getDecomposedLoc(sl);

  // Try to load the file buffer
  bool invalidTemp = false;
  StringRef file = SM.getBufferData(locInfo.first, &invalidTemp);
  if (invalidTemp) {
    SM.getDiagnostics().Report(sl, diag::err_mt_message)
        << "ERR: cannot find the original location\n";
    exit(1);
  }

  const char *tokenBegin = file.data() + locInfo.second;

  Lexer lexer(SM.getLocForStartOfFile(locInfo.first),
              R.getLangOpts(),
              file.begin(), tokenBegin, file.end());
  Token tok;
  lexer.LexFromRawLexer(tok);
  if (tok.isNot(tok::semi)) {
    SM.getDiagnostics().Report(sl, diag::err_mt_message)
        << "ERR: the next location is not a semicolon\n";
    exit(1);
  }
  // llvm::errs() << "SUCCESS: semicolon found\n";
  return tok.getLocation();
}


SourceLocation FindEndLoc(Stmt *s, Rewriter &R) {
  SourceManager &SM = R.getSourceMgr();
  SourceLocation EndSL = s->getLocEnd();
  char TailChar = *SM.getCharacterData(EndSL);
  if (TailChar == '}' || TailChar == ';') {
    return EndSL.getLocWithOffset(1);
  }
  return findSemiAfterLocation(R, EndSL).getLocWithOffset(1);
}

typedef std::vector<std::pair<UUID_t, uint64_t> > InstInfo;

void InstCompoundStmt(
    CompoundStmt *s, Rewriter &R,
    const InstInfo &instinfo) {
  std::stringstream ss;
  for (auto &Uuid_Bid : instinfo) {
    ss << "\n  " << INSTCOV_FUNC_NAME << "(" << Uuid_Bid.first.toArgString()
       << ", " << Uuid_Bid.second << ");";
  }
  R.InsertText(s->getLBracLoc().getLocWithOffset(1), ss.str(), true, true);
}

void InstSingleStmt(
    Stmt *s, Rewriter &R,
    const InstInfo &instinfo) {
  std::stringstream ss;
  ss << "{\n";
  for (auto &Uuid_Bid : instinfo) {
    ss << "  " << INSTCOV_FUNC_NAME << "(" << Uuid_Bid.first.toArgString() << ", "
       << Uuid_Bid.second << ");\n";
  }
  R.InsertText(s->getLocStart(), ss.str(), true, true);
  R.InsertText(FindEndLoc(s, R), "\n}", false, true);
}

void InstInBlock(
    Stmt *s, Rewriter &R,
    const InstInfo &instinfo) {
  if (isa<CompoundStmt>(s)) {
    InstCompoundStmt(cast<CompoundStmt>(s), R, instinfo);
  } else {
    InstSingleStmt(s, R, instinfo);
  }
}

void InstAfterBody(SourceLocation endLoc, Rewriter &R,
                   const InstInfo &instinfo,
                   bool indent = false, bool braces = false) {
  std::stringstream ss;
  ss << "\n";
  if (braces) {
    ss << "{\n";
  }
  for (auto &Uuid_Bid : instinfo) {
    if (indent) {
      ss << "  ";
    }
    ss << INSTCOV_FUNC_NAME << "(" << Uuid_Bid.first.toArgString() << ", "
       << Uuid_Bid.second << ");\n";
  }
  if (braces) {
    ss << "}";
  }
  R.InsertText(endLoc, ss.str(), false, true);
}
}

#define TRY_TO(CALL_EXPR)                                                      \
  do {                                                                  \
    if (!getDerived().CALL_EXPR)                                        \
      return false;                                                     \
  } while (0)

ASTVisitorDC::~ASTVisitorDC(void) {
  if (!DIB.getDIM().selfCheck4DC()) {
    llvm::errs() << "The debug info has problems\n";
    exit(1);
  }
}

bool ASTVisitorDC::VisitIfStmt(IfStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  VarDecl *VD = s->getConditionVariable();
  Expr *VDInit = VD ? VD->getInit() : 0;
  if (VD && !VDInit) {
    llvm::errs() << "VarDecl in IfStmt does not have initializer, why?\n";
    exit(1);
  }
  bool SimpleRHS = false;
  if (VD) {
    SimpleRHS = isSimpleRHS(VDInit);
  }
  DIB.registerDC(s, nullptr, TheRewriter.getSourceMgr());
  if (!VD) {
    MCDCVisitIfStmt(s);
  } else if (!SimpleRHS){
    Expr *RHSRoot = toRHSRoot(VDInit);
    MCDCVisitExpr(RHSRoot, s);
  }
  UUID_t uuid = DIB.getDCUUID(s);
  // Only care about If statements.
  Stmt *Then = s->getThen();
  Stmt *Else = s->getElse();

  if (VD && SimpleRHS) {
    DIB.registerDC(VDInit, s, TheRewriter.getSourceMgr());
  }

  InstInfo ThenInfo, ElseInfo;
  ThenInfo.push_back(std::make_pair(uuid, 1));
  ElseInfo.push_back(std::make_pair(uuid, 0));
  if (VD && SimpleRHS) {
    UUID_t UuidVD = DIB.getDCUUID(VDInit);
    ThenInfo.push_back(std::make_pair(UuidVD, 1));
    ElseInfo.push_back(std::make_pair(UuidVD, 0));
  }

  if (Else) {
    InstInBlock(Else, TheRewriter, ElseInfo);
  } else {
    SourceLocation ThenBodyEndLoc = FindEndLoc(Then, TheRewriter);
    InstAfterBody(ThenBodyEndLoc, TheRewriter,
                  ElseInfo, true, true);
    TheRewriter.InsertText(ThenBodyEndLoc, " else", false, true);
  }

  InstInBlock(Then, TheRewriter, ThenInfo);

  return true;
}

bool ASTVisitorDC::VisitForStmt(ForStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  DIB.registerDC(s, nullptr, TheRewriter.getSourceMgr());
  MCDCVisitForStmt(s);
  UUID_t uuid = DIB.getDCUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, InstInfo(1, std::make_pair(uuid, 0)));
  InstInBlock(s->getBody(), TheRewriter, InstInfo(1, std::make_pair(uuid, 1)));
  return true;
}

bool ASTVisitorDC::VisitWhileStmt(WhileStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  VarDecl *VD = s->getConditionVariable();
  Expr *VDInit = VD ? VD->getInit() : 0;
  if (VD && !VDInit) {
    llvm::errs() << "VarDecl in IfStmt does not have initializer, why?\n";
    exit(1);
  }
  bool SimpleRHS = false;
  if (VD) {
    SimpleRHS = isSimpleRHS(VD->getInit());
  }
  DIB.registerDC(s, nullptr, TheRewriter.getSourceMgr());
  if (!VD) {
    MCDCVisitWhileStmt(s);
  } else if (!SimpleRHS) {
    Expr *RHSRoot = toRHSRoot(VDInit);
    MCDCVisitExpr(RHSRoot, s);
  }
  UUID_t uuid = DIB.getDCUUID(s);
  if (VD && SimpleRHS) {
    DIB.registerDC(VDInit, s, TheRewriter.getSourceMgr());
  }

  InstInfo ThenInfo, ElseInfo;
  ThenInfo.push_back(std::make_pair(uuid, 1));
  ElseInfo.push_back(std::make_pair(uuid, 0));
  if (VD && SimpleRHS) {
    UUID_t UuidVD = DIB.getDCUUID(VDInit);
    ThenInfo.push_back(std::make_pair(UuidVD, 1));
    ElseInfo.push_back(std::make_pair(UuidVD, 0));
  }

  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, ElseInfo);
  InstInBlock(s->getBody(), TheRewriter, ThenInfo);
  return true;
}

bool ASTVisitorDC::VisitDoStmt(DoStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  DIB.registerDC(s, nullptr, TheRewriter.getSourceMgr());
  MCDCVisitDoStmt(s);
  TheRewriter.InsertText(s->getCond()->getLocStart(), "(", false, true);
  UUID_t uuid = DIB.getDCUUID(s);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertText(s->getRParenLoc(), ss.str(), true, true);
  return true;
}

bool ASTVisitorDC::VisitBinaryOperator(BinaryOperator *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  if (!InstRHS || !s->isAssignmentOp()) {
    return true;
  }
  handleRHS4Assgn_NormalVarDecl(s->getRHS());
  return true;
}

bool ASTVisitorDC::VisitReturnStmt(ReturnStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  if (!InstRHS) {
    return true;
  }
  if (Expr *e = s->getRetValue()) {
    handleRHS4Assgn_NormalVarDecl(e);
  }
  return true;
}

bool ASTVisitorDC::VisitAbstractConditionalOperator(
    AbstractConditionalOperator *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  SourceLocation locStart = s->getCond()->getLocStart();
  SourceLocation locEnd = s->getQuestionLoc();
  DIB.registerDC(s, nullptr, TheRewriter.getSourceMgr());
  MCDCVisitExpr(s->getCond(), s);
  TheRewriter.InsertText(locStart, "(", false, true);
  UUID_t Uuid = DIB.getDCUUID(s);
  std::stringstream ss;
  ss << "?(" << INSTCOV_FUNC_NAME << "(" << Uuid.toArgString() << ", 1), 1)"
     << ":(" << INSTCOV_FUNC_NAME << "(" << Uuid.toArgString() << ", 0), 0))";
  TheRewriter.InsertText(locEnd, ss.str(), true, true);
  return true;
}

bool ASTVisitorDC::TraverseFieldDecl(FieldDecl *d) {
  return true;
}

bool ASTVisitorDC::isSimpleRHS(Expr *e) {
  while (true) {
    if (BinaryOperator *bo = dyn_cast<BinaryOperator>(e)) {
      if (bo->isLogicalOp()) {
        return false;
      }
    }
    if (UnaryOperator *uo = dyn_cast<UnaryOperator>(e)) {
      if (uo->getOpcode() == UO_LNot) {
        return false;
      }
    }
    if (ParenExpr *pe = dyn_cast<ParenExpr>(e)) {
      e = pe->getSubExpr();
      continue;
    }
    if (CastExpr *ce = dyn_cast<CastExpr>(e)) {
      e = ce->getSubExpr();
      continue;
    }
    break;
  }
  return true;
}

bool ASTVisitorDC::VisitDeclStmt(DeclStmt *s) {
  if (!checkLocation(s, TheRewriter.getSourceMgr())) {
    return true;
  }
  if (!InstRHS) {
    return true;
  }
  for (auto &decl : s->decls()) {
    if (VarDecl *VD = dyn_cast<VarDecl>(decl)) {
      if (Expr *e = VD->getInit()) {
        handleRHS4Assgn_NormalVarDecl(e);
      }
    }
  }
  return true;
}

bool ASTVisitorDC::TraverseCallExpr(CallExpr *e) {
  if (!checkLocation(e, TheRewriter.getSourceMgr())) {
    return true;
  }
  if (FunctionDecl *decl = e->getDirectCallee()) {
    if (decl->getBuiltinID() &&
        decl->getBuiltinID() == clang::Builtin::BI__builtin_object_size) {
      // skip
      return true;
    }
  }
  RecursiveASTVisitor<ASTVisitorDC>::TraverseCallExpr(e);
  return true;
}

bool ASTVisitorDC::TraverseIfStmt(IfStmt *s) {
  TRY_TO(WalkUpFromIfStmt(s));
  for (Stmt *SubStmt : s->children()) {
    // skip the VarDecl since we have already visited it
    if (SubStmt != s->getConditionVariableDeclStmt()) {
      TraverseStmt(SubStmt);
    }
  }
  return true;
}

bool ASTVisitorDC::TraverseWhileStmt(WhileStmt *s) {
  TRY_TO(WalkUpFromWhileStmt(s));
  for (Stmt *SubStmt : s->children()) {
    // skip the VarDecl since we have already visited it
    if (SubStmt != s->getConditionVariableDeclStmt()) {
      TraverseStmt(SubStmt);
    }
  }
  return true;
}

Expr *ASTVisitorDC::toRHSRoot(Expr *e) {
  while (CastExpr *ce = dyn_cast<ImplicitCastExpr>(e)) {
    e = ce->getSubExpr();
  }
  return e;
}

void ASTVisitorDC::handleRHS4Assgn_NormalVarDecl(clang::Expr *e) {
  if (isSimpleRHS(e)) {
    return;
  }
  Expr *RHSRoot = toRHSRoot(e);
  DIB.registerDC(RHSRoot, nullptr, TheRewriter.getSourceMgr());
  MCDCVisitExpr(RHSRoot, RHSRoot);
  SourceLocation LocStart = RHSRoot->getLocStart();
  SourceLocation LocEnd = Lexer::getLocForEndOfToken(
      RHSRoot->getLocEnd(), 0,
      TheRewriter.getSourceMgr(), TheRewriter.getLangOpts());
  TheRewriter.InsertText(LocStart, "(", true, true);
  UUID_t uuid = DIB.getDCUUID(RHSRoot);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertText(LocEnd, ss.str(), false, true);
}

std::vector<Expr *> ASTVisitorDC::extractConditions(Expr *e) {
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

void ASTVisitorDC::MCDCVisitExpr(Expr *e, Stmt *p) {
  if (!InstConditions) {
    return;
  }
  std::vector<Expr *> CondExprs = extractConditions(e);
  for (auto &CondExpr : CondExprs) {
    DIB.registerDC(CondExpr, p, TheRewriter.getSourceMgr());
    UUID_t uuid = DIB.getDCUUID(CondExpr);
    TheRewriter.InsertText(CondExpr->getLocStart(), "((", true, true);
    std::string dumper;
    llvm::raw_string_ostream os(dumper);
    os << ") ? (" << INSTCOV_FUNC_NAME << "("
       << uuid.toArgString() << ",1),1) : ("
       << INSTCOV_FUNC_NAME << "(" << uuid.toArgString() << ",0),0)) ";
    os.flush();
    SourceLocation endLoc = Lexer::getLocForEndOfToken(
        CondExpr->getLocEnd(), 0, TheRewriter.getSourceMgr(),
        TheRewriter.getLangOpts());
    TheRewriter.InsertText(endLoc, dumper, false, true);
  }
}

void ASTVisitorDC::MCDCVisitIfStmt(IfStmt *s) {
  if (!InstConditions) {
    return;
  }
  VarDecl *VD = s->getConditionVariable();
  if (VD && VD->hasInit()) {
    VD->dump();
  }
  Expr *Expr4Instr = s->getCond();
  if (s->getConditionVariable()) {
    Expr4Instr = s->getConditionVariable()->getInit();
  }
  MCDCVisitExpr(Expr4Instr, s);
}

void ASTVisitorDC::MCDCVisitForStmt(ForStmt *s) {
  if (!InstConditions) {
    return;
  }
  if (s->getCond()) {
    MCDCVisitExpr(s->getCond(), s);
  }
}

void ASTVisitorDC::MCDCVisitWhileStmt(WhileStmt *s) {
  if (!InstConditions) {
    return;
  }
  Expr *Expr4Instr = s->getCond();
  if (s->getConditionVariable()) {
    Expr4Instr = s->getConditionVariable()->getInit();
  }
  MCDCVisitExpr(Expr4Instr, s);
}

void ASTVisitorDC::MCDCVisitDoStmt(DoStmt *s) {
  if (!InstConditions) {
    return;
  }
  MCDCVisitExpr(s->getCond(), s);
}

void ASTVisitorDC::MCDCVisitBinaryOperator(BinaryOperator *s) {
  if (!InstConditions) {
    return;
  }
  MCDCVisitExpr(s->getRHS(), s);
}
