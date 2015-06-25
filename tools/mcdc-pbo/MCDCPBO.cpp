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
cl::opt<bool> EmitPretty(
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
  for (auto &&FileName : FileNames) {
    LM.loadFile(FileName);
  }
  ProblemGenerator PG;
  for (auto &&Entry : LM.getLogEntries()) {
    PG.registerLogEntry(&Entry);
  }
  PBOProblem Problem = PG.emitPBO();
  std::ofstream PBOFile(OutFileName.c_str());
  std::ofstream InfoFile((OutFileName + ".info").c_str());
  if (EmitPretty) {
    Problem.emitPretty(PBOFile, PG);
  } else {
    Problem.emitRaw(PBOFile);
  }
  PG.dumpPBVar2Str(InfoFile);
  PG.dumpSID2LocInfo(InfoFile, LM);
  return 0;
}

