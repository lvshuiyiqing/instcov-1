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


int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  LogMgr LM;
  for (auto it = FileNames.begin(), ie = FileNames.end(); it != ie; ++it) {
    LM.loadFile(*it);
  }
  return 0;
}
