//===-- DCView.cpp ---------- main file for dc-view -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the main function of dc-view
/// \brief Used for viewing DC traces in a pretty way
///
//===----------------------------------------------------------------------===//

#include <iostream>
#include <fstream>
#include "instcov/RawRecordMgr.h"
#include "instcov/RecordMgr.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/raw_ostream.h"
#include "PrettyDumper.h"

using namespace llvm;
using namespace instcov;

cl::opt<std::string> TraceFileName(cl::Positional,
                                   cl::desc("<trace file>"));
cl::list<std::string> DIFileNames("di",
                                  cl::desc("[<debug info files> ...]"),
                                  cl::Required);
cl::opt<std::string> OutputFileName(
    "o",
    cl::value_desc("output file name"),
    cl::desc("Specify the output file name,\n"
             "the default is \"parsed_trace.pt\""),
    cl::init(""));
cl::opt<std::string> DumpFormat(
    "f",
    cl::value_desc("dump format"),
    cl::desc("Specify the dump format. The format is a string.\n"
             "Each character corresponds to a field.\n"
             "u: uuid, s: simplified id, l: line number, c: column number,\n"
             "f: file name, b: branch id.\n"
             "Other characters will be print verbosely."
             "The default format is \"u:b (l:c:f)\""),
    cl::init(""));

cl::opt<bool> DIOnly(
    "di-only",
    cl::desc("process the debug infomation file only.\n"
             "The trace file will not be processed.\n"
             "The default dump format will be \"u (l:c:f)\""));

int main(int argc, char *argv[]) {
  cl::ParseCommandLineOptions(argc, argv);
  if (DumpFormat == "") {
    if (DIOnly) {
      DumpFormat = "u (l:c:f)";
    } else {
      DumpFormat = "u:b (l:c:f)";
    }
  }
  DbgInfoMgr DIM;
  for (auto &DIFileName : DIFileNames) {
    std::ifstream DIFile(DIFileName.c_str(), std::ios::binary);
    if (!DIFile) {
      std::cerr << "cannot open debug info file: " << DIFileName << std::endl;
      exit(1);
    }
    DIM.load(DIFile);
  }
  if (!DIM.selfCheck4DC()) {
    llvm::errs() << "debug information has problems!\n";
    exit(1);
  }
  if (OutputFileName.empty()) {
    llvm::errs() << "output file name is empty, please use -o argument\n";
    exit(1);
  }
  std::ofstream OutFile(OutputFileName.c_str());
  if (!OutFile) {
    llvm::errs() << "cannot open output file: " << OutputFileName << "\n";
    exit(1);
  }
  PrettyDumper PD(DIM);
  if (DIOnly) {
    PD.dumpDIPretty(OutFile);
  } else {
    if (TraceFileName == "") {
      llvm::errs() << "trace file name is empty, please use -t argument\n";
      exit (1);
    }
    RawRecordMgr RRM(DIM);
    RecordMgr RM(DIM);
    RRM.loadFromFile(TraceFileName);
    RM.processTrace(RRM);
    PD.dumpTracePretty(OutFile, RM);
  }
  return 0;
}
