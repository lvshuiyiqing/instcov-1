//===-- MCDCScan.cpp --------- main file ------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the basic infrastructures for mcdc-scan
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Casting.h"
#include "instcov/LogMgr.h"
#include "MCDCAnalyzer.h"
#include "FastAnalyzer.h"
#include "SCAnalyzer.h"
#include "PBOEmitter.h"
#include <iostream>
#include <fstream>
#include <memory>

using namespace llvm;
using namespace instcov;

cl::list<std::string> FileNames(
    cl::Positional,
    cl::desc("<parsed trace files> ..."),
    cl::OneOrMore);
cl::opt<std::string> Analyzer(
    "analyzer",
    cl::desc("select the analyzer. Options:\n"
             "fast (a fast analyzer but do not accept NA entries)\n"
             "sc (default, a slower analyzer but can deal with NA entries)\n"),
    cl::init("sc"));
cl::opt<bool> CountsOnly("counts-only",
                         cl::desc("only counts"),
                         cl::init(false));
cl::opt<bool> Verbose(
    "v",
    cl::desc("dump more verbosely"),
    cl::init(false));

cl::opt<bool> EmitPBO(
    "emit-pbo",
    cl::desc("to emit a PBO problem,"
             "which is to be solved by a constraint solver\n"
             "Only combines with sc analyzer"),
    cl::init(false));

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  LogMgr LM;
  for (auto &&FileName : FileNames) {
    LM.loadFile(FileName);
  }
  if (EmitPBO && Analyzer != "sc") {
    std::cerr << "PBO emitting should be used with sc analyzer"
              << std::endl;
  }
  if (EmitPBO) {
    SCAnalyzer SCA;
    for (auto &&Entry : LM.getLogEntries()) {
      SCA.registerEntry(&Entry, LM);
    }
    PBOEmitter Emitter(SCA);
    PBOProblem Problem = Emitter.emitPBO();
    Problem.emitRaw(std::cout);
  }
  std::shared_ptr<MCDCAnalyzer> analyzer;
  if (Analyzer == "fast") {
    analyzer.reset(new FastAnalyzer());
  } else if (Analyzer == "sc") {
    analyzer.reset(new SCAnalyzer());
  } else {
    std::cerr << "wrong analyzer: " << Analyzer << std::endl;
  }
  for (auto &&Entry : LM.getLogEntries()) {
    analyzer->registerEntry(&Entry, LM);
  }
  analyzer->finalize();
  analyzer->dump(std::cout, LM);
  return 0;
}

