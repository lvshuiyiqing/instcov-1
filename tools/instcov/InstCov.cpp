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
#include "llvm/ADT/StringSet.h"
#include "instcov/InstCovASTVisitor.h"

using namespace llvm;
using namespace clang;
using namespace clang::tooling;
using namespace instcov;

cl::OptionCategory InstCovCategory("InstCov Category");

cl::list<std::string> OptMatchFileNames(
    "mf",
    cl::value_desc("file name to match"),
    cl::desc("Specifying the file names to match,\n"
             "only the code in matching files will be instrumented.\n"),
    cl::cat(InstCovCategory));

llvm::StringSet<llvm::MallocAllocator> MatchFileNames;


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
        new InstCovASTConsumer(TheRewriter, Compiler.getASTContext()));
  }
 private:
  Rewriter TheRewriter;
};

int main(int argc, const char **argv) {
  CommonOptionsParser OptionsParser(argc, argv, InstCovCategory);
  if (OptMatchFileNames.empty()) {
    llvm::errs() << "warning: no files to match,"
                 << " instcov will not do any instrumentation\n";
  }

  for (auto it = OptMatchFileNames.begin(), ie = OptMatchFileNames.end();
       it != ie; ++it) {
    MatchFileNames.insert(*it);
  }
  
  ClangTool Tool(OptionsParser.getCompilations(),
                 OptionsParser.getSourcePathList());

  Tool.run(newFrontendActionFactory<InstCovAction>().get());
  return 0;
}

