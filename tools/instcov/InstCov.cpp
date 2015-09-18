//===-- InstCov.cpp --------- main file -------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the basic infrastructures for InstCov
///
//===----------------------------------------------------------------------===//

#include <cstdio>
#include <memory>
#include <string>
#include <algorithm>

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
#include "InstCovActions.h"
#include "instcov/DbgInfoMgr.h"

using namespace llvm;
using namespace clang;
using namespace clang::tooling;
using namespace instcov;

cl::OptionCategory InstCovCategory("InstCov Category");

cl::list<std::string> OptMatchFileNames(
    "mf",
    cl::value_desc("file name to match"),
    cl::desc("Specifying the file names to match,\n"
             "only the code in matching files will be instrumented.\n"
             "If empty, InstCov will instrument all files\n"),
    cl::cat(InstCovCategory));

llvm::StringSet<llvm::MallocAllocator> MatchFileNames;

cl::list<std::string> OptActions(
    "action",
    cl::value_desc("instrumentation actions to perform"),
    cl::desc("Specifying the instrumentation actions to take.\n"
             "You may specify multiple actions.\n"
             "The following actions are allowed:\n"
             "dc: instrument decisions and conditions\n"
             "switch: instrument for switch branch coverage\n"
             "func: instrument for function coverage\n"),
    cl::cat(InstCovCategory));

// Implementation of the ASTConsumer interface for reading an AST produced
// by the Clang parser.
class InstCovASTConsumer : public ASTConsumer {
 public:
  InstCovASTConsumer(Rewriter &R)
      : TheRewriter(R) {}

  // Override the method that gets called for each parsed top-level
  // declaration.
  virtual void HandleTranslationUnit(ASTContext &Context) {
    DbgInfoMgr DIM;
    for (auto &actionString : OptActions) {
      if (actionString == "dc") {
        InstCovActionDC Action(TheRewriter, Context, DIM);
        Action.VisitTranslationUnit(Context.getTranslationUnitDecl());
        DIM.dump(TheRewriter.getSourceMgr().getFileEntryForID(
            TheRewriter.getSourceMgr().getMainFileID())->getName());
      } else if (actionString == "switch") {

      } else if (actionString == "func") {

      }
    }
  }
 private:
  Rewriter TheRewriter;
};

class InstCovFrontendAction : public ASTFrontendAction {
 public:
  std::string getOutputFileName(void) const {
    std::string InFile = getCurrentFile();
    std::size_t PeriodPos = InFile.find_last_of('.');
    if (PeriodPos == std::string::npos) {
      llvm::errs() << "incorrect file name type: " << InFile << "\n";
      exit(1);
    }
    std::string Prefix = InFile.substr(0, PeriodPos);
    std::string Suffix = InFile.substr(PeriodPos);
    return Prefix + ".trans" + Suffix;
  }

  virtual void EndSourceFileAction() override {
    SourceManager &SM = TheRewriter.getSourceMgr();
    std::error_code EC;
    raw_fd_ostream OutFile(
        getOutputFileName(), EC, llvm::sys::fs::F_None);
    TheRewriter.getEditBuffer(SM.getMainFileID()).write(OutFile);
  }

  virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
      clang::CompilerInstance &Compiler, llvm::StringRef InFile) override {
    // llvm::errs() << "** Creating AST consumer for: " << InFile << "\n";
    TheRewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
    return std::unique_ptr<clang::ASTConsumer>(
        new InstCovASTConsumer(TheRewriter));
  }
 private:
  Rewriter TheRewriter;
};

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, InstCovCategory);
  if (OptMatchFileNames.empty()) {
    llvm::errs() << "warning: no files to match,"
                 << " instcov will instrument all files\n";
  }

  for (auto MatchFileName : OptMatchFileNames) {
    MatchFileNames.insert(MatchFileName);
  }

  // check actions
  std::vector<std::string> ActionStrings(OptActions.begin(), OptActions.end());
  std::sort(ActionStrings.begin(), ActionStrings.end());
  for (std::size_t i = 1; i < ActionStrings.size(); ++i) {
    if (ActionStrings[i] == ActionStrings[i-1]) {
      llvm::errs() << "ERR: duplicate action " << ActionStrings[i] << "\n";
      exit(1);
    }
    if (ActionStrings[i] != "dc" &&
        ActionStrings[i] != "switch" &&
        ActionStrings[i] != "func") {
      llvm::errs() << "ERR: unrecognized action " << ActionStrings[i] << "\n";
      exit(1);
    }
  }
  ClangTool Tool(OptionsParser.getCompilations(),
                 OptionsParser.getSourcePathList());

  return Tool.run(newFrontendActionFactory<InstCovFrontendAction>().get());
}
