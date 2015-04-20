//===-- RecordMgr.cpp ----- trace record manager definition -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition for trace record manager
///
//===----------------------------------------------------------------------===//

#include <iostream>
#include <fstream>
#include "instcov/RecordMgr.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;
using namespace instcov;

cl::opt<std::string> TraceFileName(cl::Positional,
                                   cl::desc("<trace file>"),
                                   cl::Required);
cl::list<std::string> FileNames(cl::Positional,
                                cl::desc("[<debug info files> ...]"),
                                cl::Required);
cl::opt<std::string> OutputFileName("o",
                                    cl::value_desc("output file name"),
                                    cl::init("parsed_trace.pt"));
                                
int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  RecordMgr RM;
  for (auto it = FileNames.begin(), ie = FileNames.end(); it != ie; ++it) {
    RM.getDIBB().loadFile(*it);
  }
  if (RM.getDIBB().selfCheck()) {
    llvm::errs() << "debug information contain circles!\n";
    exit(1);
  }
  RM.processTrace(TraceFileName);
  std::ofstream OutFile(OutputFileName.c_str());
  if (!OutFile) {
    llvm::errs() << "cannot open output file: " << OutputFileName << "\n";
    exit(1);
  }
  RM.dump(OutFile);
  return 0;
}

