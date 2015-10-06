//===-- InstCovView.cpp ----- main file for instcov-view --------*- C++ -*-===//
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
#include "instcov/DCRecordMgr.h"
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

cl::opt<bool> OptDC(
    "dc",
    cl::desc("organize the decisions/conditions in the trace/debug\n"
             "information in a tree format\n"));
cl::opt<bool> OptDI(
    "di-only",
    cl::desc("process the debug infomation file only.\n"
             "The trace file will not be processed.\n"));

struct OutFile {
  OutFile(const std::string &FileName) {
    if (FileName == "") {
      IsStdOut = true;
      OS = &std::cout;
    } else {
      IsStdOut = false;
      OS = new std::ofstream(FileName.c_str());
      if (!(*OS)) {
        std::cerr << "cannot open file for output: " << FileName << std::endl;
        exit(1);
      }
    }
  }
  ~OutFile(void) {
    if (!IsStdOut) {
      delete OS;
    }
  }
  std::ostream &getStream(void) const {
    return *OS;
  }
 private:
  bool IsStdOut;
  std::ostream *OS;
};

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
  if (!DIM.selfCheck4DC()) {
    llvm::errs() << "debug information has problems!\n";
    exit(1);
  }

  OutFile OS(OutputFileName);
  PrettyDumper PD(DIM);
  if (OptDI) {
    if (OptDC) {
      PD.dumpDIPrettyDC(OS.getStream());
    } else {
      PD.dumpDIPretty(OS.getStream());
    }
  } else {
    if (TraceFileName == "") {
      llvm::errs() << "trace file name is empty, please use -t argument\n";
      exit (1);
    }
    RawRecordMgr RRM(DIM);
    RRM.loadFromFile(TraceFileName);
    if (OptDC) {
      DCRecordMgr DCRM(DIM);
      DCRM.processTrace(RRM);
      PD.dumpTracePrettyDC(OS.getStream(), DCRM);
    } else {
      PD.dumpTracePretty(OS.getStream(), RRM);
    }
  }
  return 0;
}
