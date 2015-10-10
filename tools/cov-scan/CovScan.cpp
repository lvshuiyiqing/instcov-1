//===-- CovScan.cpp ---------- main file ------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the main file of cov-scan
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Casting.h"
#include "instcov/DCRecord.h"
#include "instcov/RawRecordMgr.h"
#include "instcov/DCRecordMgr.h"
#include "instcov/DCRecordBuilder.h"
#include "MCDCAnalyzer.h"
#include "MCDCAnalyzerFast.h"
#include "MCDCAnalyzerSC.h"
#include "FuncAnalyzer.h"
#include "DCAnalyzer.h"
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
cl::opt<std::string> OptMCDCAnalyzer(
    "mcdc-analyzer",
    cl::desc("select the MCDC analyzer. Options:\n"
             "fast (a fast analyzer but do not accept NA entries,\n"
             "      no short-circuits are allowed)\n"
             "sc (default, a slower analyzer but can deal with NA entries,"
             "    allows short-circuits)\n"),
    cl::init("sc"));
cl::opt<bool> CountsOnly(
    "mcdc-counts-only",
    cl::desc("only output counts for mcdc analysis"),
    cl::init(false));
cl::opt<bool> Verbose(
    "mcdc-verbose",
    cl::desc("dump more verbosely"),
    cl::init(false));

cl::opt<bool> EmitPBO(
    "mcdc-emit-pbo",
    cl::desc("to emit a PBO problem,"
             "which is to be solved by a constraint solver\n"
             "Only combines with sc analyzer"),
    cl::init(false));

cl::opt<bool> EmitPretty(
    "mcdc-emit-pretty",
    cl::desc("emit pretty-style PBO output"),
    cl::init(false));

cl::opt<std::string> OutFileName(
    "o",
    cl::desc("specify the output file"));

cl::opt<std::string> OptAnalyzer(
    "analyzer",
    cl::desc("select the analyzer. Options:\n"
             "dc: decision (branch) coverage or condition coverage analyzer\n"
             "func: function coverage analyzer\n"
             "mcdc: mcdc coverage analyzer"));

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
  if (OptAnalyzer == "mcdc") {
    if (EmitPBO && OptMCDCAnalyzer != "sc") {
      std::cerr << "PBO emitting should be used with sc analyzer"
                << std::endl;
      return 1;
    }
    std::shared_ptr<MCDCAnalyzer> analyzer;
    if (OptMCDCAnalyzer == "fast") {
      analyzer.reset(new MCDCAnalyzerFast(DIM));
    } else if (OptMCDCAnalyzer == "sc") {
      analyzer.reset(new MCDCAnalyzerSC(DIM));
    } else {
      std::cerr << "wrong MCDC analyzer: " << OptMCDCAnalyzer << std::endl;
    }
    std::size_t TID = 0;
    for (auto &TraceFileName : TraceFileNames) {
      RawRecordMgr RRM(DIM);
      RRM.loadFromFile(TraceFileName);
      DCRecordMgr DCRM(DIM);
      DCRM.processTrace(RRM);
      std::size_t VID = 0;
      for (auto &RecordBuilder : DCRM.getRecordBuilders()) {
        DCRecord DCR = RecordBuilder->convert2DCRecord();
        DCR.TID = TID;
        DCR.VID = VID;
        ++VID;
        analyzer->registerDCRecord(&DCR);
      }
      ++TID;
    }

    if (EmitPBO) {
      MCDCAnalyzerSC *SCA = cast<MCDCAnalyzerSC>(analyzer.get());
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
      analyzer->dump(*OS);
    }
  } else if (OptAnalyzer == "dc") {
    DCAnalyzer analyzer(DIM);
    for (auto &TraceFileName : TraceFileNames) {
      RawRecordMgr RRM(DIM);
      RRM.loadFromFile(TraceFileName);
      for (auto &RR : RRM.getRecords()) {
        analyzer.registerRawRecord(RR);
      }
    }
    analyzer.dump(*OS);
  } else if (OptAnalyzer == "func") {
    FuncAnalyzer analyzer(DIM);
    for (auto &TraceFileName : TraceFileNames) {
      RawRecordMgr RRM(DIM);
      RRM.loadFromFile(TraceFileName);
      for (auto &&RR : RRM.getRecords()) {
        analyzer.registerRawRecord(RR);
      }
    }
    analyzer.dump(*OS);
  } else {
    std::cerr << "unrecognized analyzer: " << OptAnalyzer << std::endl;
    exit(1);
  }
  return 0;
}
