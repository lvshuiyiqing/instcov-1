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
#include "LogMgr.h"
#include "MCDCAnalyzer.h"
#include "FastAnalyzer.h"
#include <iostream>
#include <fstream>
#include <memory>

using namespace llvm;
using namespace instcov;

cl::list<std::string> FileNames(cl::Positional,
                                cl::desc("<parsed trace files> ..."),
                                cl::OneOrMore);

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  LogMgr LM;
  for (auto it = FileNames.begin(), ie = FileNames.end(); it != ie; ++it) {
    LM.loadFile(*it);
  }
  std::shared_ptr<MCDCAnalyzer> analyzer(new FastAnalyzer());
  for (auto it = LM.getLogEntries().begin(), ie = LM.getLogEntries().end();
       it != ie; ++it) {
    analyzer->registerEntry(&(*it));
  }
  analyzer->dump(std::cout, LM);
  return 0;
}

