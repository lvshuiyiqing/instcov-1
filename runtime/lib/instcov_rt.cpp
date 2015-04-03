//===-- instcov_rt.cpp ------ InstCov runtime library file ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the runtime function definitions for InstCov
///
//===----------------------------------------------------------------------===//

#include <iostream>
#include <fstream>

extern "C" {
  void instcov_dump(uint64_t id, uint64_t bid);
}

namespace {
static class InstCovLogger {
 public:
  InstCovLogger(void) {
    TraceFile.open("test.trace");
  }

  ~InstCovLogger(void) {
    TraceFile.close();
  }

  void Log(uint64_t id, uint64_t bid) {
    TraceFile << "(" << id << ", " << bid << ")\n";
  }
  
  std::ofstream TraceFile;
} staInstCovLogger;

}

void instcov_dump(uint64_t id, uint64_t bid) {
  staInstCovLogger.Log(id, bid);
}

