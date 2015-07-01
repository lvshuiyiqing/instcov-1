//===-- InstCovInstDecisions.cpp --- decision instrumentation ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for decision
/// instrumentation functions in InstcovASTVisitor
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
#include "InstCovASTVisitor.h"

using namespace llvm;
using namespace clang;
using namespace instcov;

extern llvm::cl::OptionCategory InstCovCategory;

cl::opt<bool> InstSwitch(
    "inst-switch",
    cl::desc("enable switch instrumentation.\n"
             "Default value: false\n"),
    cl::cat(InstCovCategory),
    cl::init(false));

cl::opt<bool> InstRHS(
    "inst-RHS",
    cl::desc("enable RHS value instrumentation,\n"
             "including assignment operator, VarDecls and return statements\n"
             "Default value: false\n"),
    cl::cat(InstCovCategory),
    cl::init(false));

extern llvm::StringSet<llvm::MallocAllocator> MatchFileNames;

namespace{
  std::string INSTCOV_FUNC_NAME = "instcov_dump";

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
    for (auto &&Uuid_Bid : instinfo) {
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
    for (auto &&Uuid_Bid : instinfo) {
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
    for (auto &&Uuid_Bid : instinfo) {
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

InstCovASTVisitor::~InstCovASTVisitor(void) {
  if (!DIB.selfCheck()) {
    llvm::errs() << "The debug info has problems\n";
    exit(1);
  }
  DIB.dump(TheRewriter.getSourceMgr().getFileEntryForID(
      TheRewriter.getSourceMgr().getMainFileID())->getName());
}

bool InstCovASTVisitor::checkLocation(Stmt *s) const {
  if (MatchFileNames.empty()) {
    return true;
  }
  SourceManager &SM = TheRewriter.getSourceMgr();
  StringRef PresumedFileName =
      SM.getPresumedLoc(s->getLocStart()).getFilename();
  return MatchFileNames.count(PresumedFileName);
}

bool InstCovASTVisitor::VisitIfStmt(IfStmt *s) {
  if (!checkLocation(s)) {
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
    VisitedDecls.insert(s->getConditionVariableDeclStmt());
    SimpleRHS = isSimpleRHS(VDInit);
  }
  if (!VD) {
    MCDCVisitIfStmt(s);
  } else if (!SimpleRHS){
    Expr *RHSRoot = toRHSRoot(VDInit);
    MCDCVisitExpr(RHSRoot, s);
  }
  DIB.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIB.getUUID(s);
  // Only care about If statements.
  Stmt *Then = s->getThen();
  Stmt *Else = s->getElse();

  if (VD && SimpleRHS) {
    DIB.registerStmt(VDInit, s, TheRewriter.getSourceMgr());
  }

  InstInfo ThenInfo, ElseInfo;
  ThenInfo.push_back(std::make_pair(uuid, 1));
  ElseInfo.push_back(std::make_pair(uuid, 0));
  if (VD && SimpleRHS) {
    UUID_t UuidVD = DIB.getUUID(VDInit);
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

bool InstCovASTVisitor::VisitForStmt(ForStmt *s) {
  if (!checkLocation(s)) {
    return true;
  }
  MCDCVisitForStmt(s);
  DIB.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIB.getUUID(s);
  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, InstInfo(1, std::make_pair(uuid, 0)));
  InstInBlock(s->getBody(), TheRewriter, InstInfo(1, std::make_pair(uuid, 1)));
  return true;
}

bool InstCovASTVisitor::VisitWhileStmt(WhileStmt *s) {
  if (!checkLocation(s)) {
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
    VisitedDecls.insert(s->getConditionVariableDeclStmt());
  }
  if (!VD) {
    MCDCVisitWhileStmt(s);
  } else if (!SimpleRHS) {
    Expr *RHSRoot = toRHSRoot(VDInit);
    MCDCVisitExpr(RHSRoot, s);
  }
  DIB.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t uuid = DIB.getUUID(s);
  if (VD && SimpleRHS) {
    DIB.registerStmt(VDInit, s, TheRewriter.getSourceMgr());
  }

  InstInfo ThenInfo, ElseInfo;
  ThenInfo.push_back(std::make_pair(uuid, 1));
  ElseInfo.push_back(std::make_pair(uuid, 0));
  if (VD && SimpleRHS) {
    UUID_t UuidVD = DIB.getUUID(VDInit);
    ThenInfo.push_back(std::make_pair(UuidVD, 1));
    ElseInfo.push_back(std::make_pair(UuidVD, 0));
  }

  SourceLocation BodyEndLoc = FindEndLoc(s->getBody(), TheRewriter);
  InstAfterBody(BodyEndLoc, TheRewriter, ElseInfo);
  InstInBlock(s->getBody(), TheRewriter, ThenInfo);
  return true;
}

bool InstCovASTVisitor::VisitDoStmt(DoStmt *s) {
  if (!checkLocation(s)) {
    return true;
  }
  MCDCVisitDoStmt(s);
  DIB.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  TheRewriter.InsertText(s->getCond()->getLocStart(), "(", true, true);
  UUID_t uuid = DIB.getUUID(s);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertText(s->getRParenLoc(), ss.str(), false, true);
  return true;
}

bool InstCovASTVisitor::VisitSwitchStmt(SwitchStmt *s) {
  if (!checkLocation(s)) {
    return true;
  }
  if (!InstSwitch) {
    return true;
  }
  std::stringstream header_ss;
  DIB.registerStmt(s, nullptr, TheRewriter.getSourceMgr());
  UUID_t Uuid = DIB.getUUID(s);
  // BUG FIX: added a ";" before the VarDecl so that this will be legal after
  // a goto label
  header_ss << ";int instcov_f" << Uuid.toString() << " = 1;\n";
  TheRewriter.InsertText(s->getLocStart(), header_ss.str(), true, true);
  SwitchCase *SC = s->getSwitchCaseList();
  uint64_t bid = 2;
  while (SC) {
    if (!isa<CaseStmt>(SC->getSubStmt())) {
      std::stringstream ss;
      ss.clear();
      ss << "if (instcov_f" << Uuid.toString() << " == 1) {\n"
         << "  instcov_dump(" << Uuid.toArgString() << ", " << bid++ << ");\n"
         << "  instcov_f" << Uuid.toString() << " = 0;\n"
         << "}\n";
      TheRewriter.InsertText(SC->getSubStmt()->getLocStart(), ss.str(),
                             true, true);
    }
    SC = SC->getNextSwitchCase();
  }
  return true;
}

bool InstCovASTVisitor::VisitBinaryOperator(BinaryOperator *s) {
  if (!checkLocation(s)) {
    return true;
  }
  if (!InstRHS || !s->isAssignmentOp()) {
    return true;
  }
  handleRHS4Assgn_NormalVarDecl(s->getRHS());
  return true;
}

bool InstCovASTVisitor::VisitReturnStmt(ReturnStmt *s) {
  if (!checkLocation(s)) {
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

bool InstCovASTVisitor::VisitAbstractConditionalOperator(
    AbstractConditionalOperator *s) {
  if (!checkLocation(s)) {
    return true;
  }
  MCDCVisitExpr(s->getCond());
  return true;
}

bool InstCovASTVisitor::VisitFieldDecl(FieldDecl *d) {
  return false;
}

bool InstCovASTVisitor::isSimpleRHS(Expr *e) {
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

bool InstCovASTVisitor::VisitDeclStmt(DeclStmt *s) {
  if (!checkLocation(s)) {
    return true;
  }
  if (VisitedDecls.count(s)) {
    return true;
  }
  VisitedDecls.insert(s);
  if (!InstRHS) {
    return true;
  }
  for (auto &&decl : s->decls()) {
    if (VarDecl *VD = dyn_cast<VarDecl>(decl)) {
      if (Expr *e = VD->getInit()) {
        handleRHS4Assgn_NormalVarDecl(e);
      }
    }
  }
  return true;
}

bool InstCovASTVisitor::VisitCallExpr(CallExpr *e) {
  if (!checkLocation(e)) {
    return true;
  }
  if (FunctionDecl *decl = e->getDirectCallee()) {
    if (decl->getBuiltinID() &&
        decl->getBuiltinID() == clang::Builtin::BI__builtin_object_size) {
      return false;
    }
  }
  return true;
}

Expr *InstCovASTVisitor::toRHSRoot(Expr *e) {
  while (CastExpr *ce = dyn_cast<ImplicitCastExpr>(e)) {
    e = ce->getSubExpr();
  }
  return e;
}

void InstCovASTVisitor::handleRHS4Assgn_NormalVarDecl(clang::Expr *e) {
  if (isSimpleRHS(e)) {
    return;
  }
  Expr *RHSRoot = toRHSRoot(e);
  MCDCVisitExpr(RHSRoot, RHSRoot);
  SourceLocation LocStart = RHSRoot->getLocStart();
  SourceLocation LocEnd = Lexer::getLocForEndOfToken(
      RHSRoot->getLocEnd(), 0,
      TheRewriter.getSourceMgr(), TheRewriter.getLangOpts());
  DIB.registerStmt(RHSRoot, nullptr, TheRewriter.getSourceMgr());
  TheRewriter.InsertText(LocStart, "(", true, true);
  UUID_t uuid = DIB.getUUID(RHSRoot);
  std::stringstream ss;
  ss << ") ? (" << INSTCOV_FUNC_NAME << "(" << uuid.toArgString()
     << ", 0), 1) : (" << INSTCOV_FUNC_NAME << "("<< uuid.toArgString()
     << ", 1), 0)";
  TheRewriter.InsertText(LocEnd, ss.str(), false, true);
}
