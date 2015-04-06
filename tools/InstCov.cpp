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
#include "InstCovASTVisitor.h"

using namespace llvm;
using namespace clang;
using namespace clang::tooling;

cl::OptionCategory InstCovCategory("InstCov Category");

cl::opt<bool> InstBranches(
    "inst-branches",
    cl::desc("enable instrumentation for if/for/while/do"),
    cl::cat(InstCovCategory),
    cl::init(true));

cl::opt<bool> InstExprs(
    "inst-expr",
    cl::desc("enable expression instrumentation for MC/DC"),
    cl::cat(InstCovCategory),
    cl::init(false));

// Implementation of the ASTConsumer interface for reading an AST produced
// by the Clang parser.
class InstCovASTConsumer : public ASTConsumer {
 public:
  InstCovASTConsumer(Rewriter &R) : Visitor(R) {}

  // Override the method that gets called for each parsed top-level
  // declaration.
  virtual bool HandleTopLevelDecl(DeclGroupRef DR) {
    for (DeclGroupRef::iterator b = DR.begin(), e = DR.end(); b != e; ++b)
      // Traverse the declaration using our AST visitor.
      Visitor.TraverseDecl(*b);
    return true;
  }

private:
  InstCovASTVisitor Visitor;
};

class InstCovAction : public ASTFrontendAction {
 public:
  virtual void EndSourceFileAction() override {
    SourceManager &SM = TheRewriter.getSourceMgr();
    llvm::errs() << "** EndSourceFileAction for: "
                 << SM.getFileEntryForID(SM.getMainFileID())->getName() << "\n";

    TheRewriter.getEditBuffer(SM.getMainFileID()).write(llvm::outs());
  }

  virtual std::unique_ptr<clang::ASTConsumer> CreateASTConsumer(
      clang::CompilerInstance &Compiler, llvm::StringRef InFile) override {
    llvm::errs() << "** Creating AST consumer for: " << InFile << "\n";
    TheRewriter.setSourceMgr(Compiler.getSourceManager(), Compiler.getLangOpts());
    return std::unique_ptr<clang::ASTConsumer>(
        new InstCovASTConsumer(TheRewriter));
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
