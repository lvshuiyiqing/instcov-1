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
#include "instcov/RawRecordMgr.h"
#include "instcov/RecordMgr.h"
#include "MCDCAnalyzer.h"
#include "FastAnalyzer.h"
#include "SCAnalyzer.h"
#include "PBOEmitter.h"
#include <iostream>
#include <fstream>
#include <memory>

using namespace llvm;
using namespace instcov;

cl::list<std::string> TraceFileNames(
    cl::Positional,
    cl::desc("<parsed trace files> ..."),
    cl::OneOrMore);
cl::list<std::string> DIFileNames(
    "di",
    cl::desc("<debug info files> ..."),
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
    cl::desc("specify the output file"));

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  DbgInfoMgr DIM;
  for (auto &DIFileName : DIFileNames) {
    std::ifstream DIFile(DIFileName.c_str(), std::ios::binary);
    if (!DIFile) {
      std::cerr << "cannot open debug info file: " << DIFileName << std::endl;
      exit(1);
    }
    DIM.load(DIFile);
  }
  if (EmitPBO && Analyzer != "sc") {
    std::cerr << "PBO emitting should be used with sc analyzer"
              << std::endl;
    return 1;
  }
  std::unique_ptr<std::ofstream> OutFile;
  std::ostream *OS = &std::cout;
  if (!OutFileName.empty()) {
    OutFile.reset(new std::ofstream(OutFileName.c_str()));
    if (!OutFile) {
      std::cerr << "cannot open \"" << OutFileName << "\" for output"
                << std::endl;
      return 1;
    }
    OS = OutFile.get();
  }
  std::shared_ptr<MCDCAnalyzer> analyzer;
  if (Analyzer == "fast") {
    analyzer.reset(new FastAnalyzer());
  } else if (Analyzer == "sc") {
    analyzer.reset(new SCAnalyzer());
  } else {
    std::cerr << "wrong analyzer: " << Analyzer << std::endl;
  }
  std::size_t TID = 0;
  for (auto &TraceFileName : TraceFileNames) {
    RawRecordMgr RRM(DIM);
    RRM.loadFromFile(TraceFileName);
    RecordMgr RM(DIM);
    RM.processTrace(RRM);
    std::size_t VID = 0;
    for (auto &RecordTree : RM.getRecordTrees()) {
      LogEntry LE = RecordTree->convert2LogEntry();
      LE.TID = TID;
      LE.VID = VID;
      ++VID;
      analyzer->registerEntry(&LE, DIM);
    }
    ++TID;
  }

  if (EmitPBO) {
    SCAnalyzer *SCA = cast<SCAnalyzer>(analyzer.get());
    PBOEmitter Emitter(*SCA);
    PBOProblemOpt Problem = Emitter.emitPBO();
    if (EmitPretty) {
      Problem.emitPretty(*OS, Emitter.getID2Str());
    } else {
      Problem.emitRaw(*OS);
    }
    Emitter.dumpPBVar2Str(*OS);
    Emitter.dumpSID2LocInfo(*OS, DIM);
  } else {
    analyzer->finalize();
    analyzer->dump(*OS, DIM);
  }
  return 0;
}
