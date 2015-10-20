//===-- InstCovActions.cpp ------ InstCovActions definition -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for InstCovActions
/// \brief Each action wraps an ASTVisitor for doing specific instrumentations
///
//===----------------------------------------------------------------------===//

#include "InstCovActions.h"
#include "ASTVisitorDC.h"
#include "ASTVisitorSwitch.h"
#include "ASTVisitorFunc.h"

using namespace instcov;

namespace {
typedef InstCovAction *(FuncType_CreateInstance)(
    clang::Rewriter &R,
    clang::ASTContext &C,
    DbgInfoMgr &dim);
}

class InstCovActionDC : public InstCovAction {
 public:
  InstCovActionDC(clang::Rewriter &R,
                  clang::ASTContext &C,
                  DbgInfoMgr &dim)
      : InstCovAction(R, C, dim) {}

  virtual ~InstCovActionDC(void) {}

 public:
  virtual void VisitTranslationUnit(clang::TranslationUnitDecl *D) {
    ASTVisitorDC Visitor(TheRewriter, TheASTContext, DIM);
    Visitor.TraverseDecl(D);
  }

  static InstCovAction *CreateInstance(
      clang::Rewriter &R,
      clang::ASTContext &C,
      DbgInfoMgr &dim) {
    return new InstCovActionDC(R, C, dim);
  }
};

class InstCovActionSwitch : public InstCovAction {
 public:
  InstCovActionSwitch(clang::Rewriter &R,
                      clang::ASTContext &C,
                      DbgInfoMgr &dim)
      : InstCovAction(R, C, dim) {}

  virtual ~InstCovActionSwitch(void) {}

 public:
  virtual void VisitTranslationUnit(clang::TranslationUnitDecl *D) {
    ASTVisitorSwitch Visitor(TheRewriter, TheASTContext, DIM);
    Visitor.TraverseDecl(D);
  }

  static InstCovAction *CreateInstance(
      clang::Rewriter &R,
      clang::ASTContext &C,
      DbgInfoMgr &dim) {
    return new InstCovActionSwitch(R, C, dim);
  }
};

class InstCovActionFunc : public InstCovAction {
 public:
  InstCovActionFunc(clang::Rewriter &R,
                    clang::ASTContext &C,
                    DbgInfoMgr &dim)
      : InstCovAction(R, C, dim) {}

  virtual ~InstCovActionFunc(void) {}

 public:
  virtual void VisitTranslationUnit(clang::TranslationUnitDecl *D) {
    ASTVisitorFunc Visitor(TheRewriter, TheASTContext, DIM);
    Visitor.TraverseDecl(D);
  }

  static InstCovAction *CreateInstance(
      clang::Rewriter &R,
      clang::ASTContext &C,
      DbgInfoMgr &dim) {
    return new InstCovActionFunc(R, C, dim);
  }
};

namespace {
struct ActionInfo {
  ActionInfo(void) {}
  ActionInfo(const std::string &id, const std::string &desc,
             FuncType_CreateInstance *cf)
      : ID(id), Desc(desc), CreateFunc(cf) {
  }
  std::string ID;
  std::string Desc;
  FuncType_CreateInstance *CreateFunc;
};

std::map<std::string, ActionInfo> ActionInfoList;

struct ActionInfoListIniter {
 public:
  ActionInfoListIniter(void) {
    ActionInfoList["dc"] =
        ActionInfo("dc",
                   "instrument decisions and conditions",
                   &InstCovActionDC::CreateInstance);
    ActionInfoList["switch"] =
        ActionInfo("switch", "switch: instrument for switch branch coverage",
                   &InstCovActionSwitch::CreateInstance);
    ActionInfoList["func"] =
        ActionInfo("func", "instrument for function coverage",
                   &InstCovActionFunc::CreateInstance);
  }
} staIniter;
}

InstCovAction* InstCovAction::CreateAction(
    const std::string &actionName,
    clang::Rewriter &R,
    clang::ASTContext &C,
    DbgInfoMgr &dim) {
  if (ActionInfoList.count(actionName) == 0) {
    return 0;
  }
  const ActionInfo &AI = ActionInfoList.find(actionName)->second;
  return (*(AI.CreateFunc))(R, C, dim);
}
