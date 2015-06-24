//===-- MCDCPBO.cpp ---------- main file ------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the main file for mcdc-pbo
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/CommandLine.h"
#include "instcov/LogMgr.h"
#include <iostream>
#include <fstream>
#include <memory>
#include "ProblemGenerator.h"

using namespace llvm;
using namespace instcov;

cl::list<std::string> FileNames(
    cl::Positional,
    cl::desc("<parsed trace files> ..."),
    cl::OneOrMore);
cl::opt<std::string> OutFileName(
    "o",
    cl::desc("PBO output file name"),
    cl::Required);
cl::opt<bool> DumpPretty(
    "emit-pretty",
    cl::desc("emit pretty-style PBO output"),
    cl::init(false));

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  if (OutFileName.empty()) {
    std::cerr << "ERR: output file name is empty" << std::endl;
    exit(1);
  }
  LogMgr LM;
  for (auto it = FileNames.begin(), ie = FileNames.end(); it != ie; ++it) {
    LM.loadFile(*it);
  }
  ProblemGenerator PG;
  for (auto it = LM.getLogEntries().begin(), ie = LM.getLogEntries().end();
       it != ie; ++it) {
    PG.registerLogEntry(&(*it));
  }
  PBOProblem Problem = PG.emitPBO();
  std::ofstream PBOFile(OutFileName.c_str());
  std::ofstream InfoFile((OutFileName + ".info").c_str());
  if (DumpPretty) {
    Problem.emitRaw(PBOFile);
  } else {
    Problem.emitPretty(PBOFile, PG);
  }
  PG.dumpID2Str(InfoFile);
  return 0;
}

