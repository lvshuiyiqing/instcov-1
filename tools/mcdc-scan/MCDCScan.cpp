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
#include <iostream>
#include <fstream>

using namespace llvm;
using namespace instcov;

cl::list<std::string> FileNames(cl::Positional,
                                cl::desc("<parsed trace files> ..."),
                                cl::OneOrMore);

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
  // for (auto it = LM.getLogEntries().begin(), ie = LM.getLogEntries().end();
  //      it != ie; ++it) {
  //   std::cout << "<" << it->FID << ", " << it->RID << "> ";
  //   std::cout << it->Decision.second << ": ";
  //   for (auto itc = it->Conditions.begin(), etc = it->Conditions.end();
  //        itc != etc; ++itc) {
  //     if (itc != it->Conditions.begin()) {
  //       std::cout << ", ";
  //     }
  //     std::cout << itc->second;
  //   }
  //   std::cout << std::endl;
  // }
  MCDCAnalyzer analyzer;
  for (auto it = LM.getLogEntries().begin(), ie = LM.getLogEntries().end();
       it != ie; ++it) {
    analyzer.registerEntry(&(*it));
  }
  if (Verbose) {
    analyzer.dumpVerbose(std::cout);
  } else {
    analyzer.dumpReport(std::cout, LM);
  }
  return 0;  
}

