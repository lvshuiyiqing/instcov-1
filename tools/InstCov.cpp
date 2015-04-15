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

using namespace llvm;
using namespace clang;
using namespace clang::tooling;
using namespace instcov;

cl::OptionCategory InstCovCategory("InstCov Category");

cl::opt<bool> InstDecisions(
    "inst-decisions",
    cl::desc("enable decision instrumentation for if/for/while/do"),
    cl::cat(InstCovCategory),
    cl::init(true));

cl::opt<bool> InstConditions(
    "inst-conditions",
    cl::desc("enable condition instrumentation for MC/DC.\n\
The instrumentation may change the program behavior\n\
if the conditions have side-effects"),
    cl::cat(InstCovCategory),
    cl::init(false));

// Implementation of the ASTConsumer interface for reading an AST produced
// by the Clang parser.
class InstCovASTConsumer : public ASTConsumer {
 public:
  InstCovASTConsumer(Rewriter &R, ASTContext &C) : Visitor(R, C) {}

  // Override the method that gets called for each parsed top-level
  // declaration.
  virtual void HandleTranslationUnit(ASTContext &Context) {
    Visitor.TraverseDecl(Context.getTranslationUnitDecl());
  }

private:
  InstCovASTVisitor Visitor;
};

class InstCovAction : public ASTFrontendAction {
 public:
  virtual void EndSourceFileAction() override {
    SourceManager &SM = TheRewriter.getSourceMgr();
    // llvm::errs() << "** EndSourceFileAction for: "
    //              << SM.getFileEntryForID(SM.getMainFileID())->getName() << "\n";

    TheRewriter.getEditBuffer(SM.getMainFileID()).write(llvm::outs());
  }

  virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
      clang::CompilerInstance &Compiler, llvm::StringRef InFile) override {
    // llvm::errs() << "** Creating AST consumer for: " << InFile << "\n";
    TheRewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
    return std::unique_ptr<clang::ASTConsumer>(
        new InstCovASTConsumer(TheRewriter, Compiler.getASTContext()));
  }
 private:
  Rewriter TheRewriter;
};

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, InstCovCategory);
  ClangTool Tool(OptionsParser.getCompilations(),
                 OptionsParser.getSourcePathList());

  Tool.run(newFrontendActionFactory<InstCovAction>().get());
  return 0;
}

