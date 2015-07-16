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

cl::opt<bool> EmitPretty(
    "emit-pretty",
    cl::desc("emit pretty-style PBO output"),
    cl::init(false));

cl::opt<std::string> OutFileName(
    "o",
    cl::desc("specify the output file"),
    cl::Required);

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  LogMgr LM;
  for (auto &&FileName : FileNames) {
    LM.loadFile(FileName);
  }
  if (EmitPBO && Analyzer != "sc") {
    std::cerr << "PBO emitting should be used with sc analyzer"
              << std::endl;
    return 1;
  }
  std::ofstream OutFile(OutFileName.c_str());
  if (!OutFile) {
    std::cerr << "cannot open \"" << OutFileName << "\" for output"
              << std::endl;
    return 1;
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
  if (EmitPBO) {
    SCAnalyzer *SCA = cast<SCAnalyzer>(analyzer.get());
    PBOEmitter Emitter(*SCA);
    PBOProblemOpt Problem = Emitter.emitPBO();
    if (EmitPretty) {
      Problem.emitPretty(OutFile, Emitter.getID2Str());
    } else {
      Problem.emitRaw(OutFile);
    }
    Emitter.dumpPBVar2Str(OutFile);
    Emitter.dumpSID2LocInfo(OutFile, LM);
  } else {
    analyzer->finalize();
    analyzer->dump(OutFile, LM);
  }
  return 0;
}

