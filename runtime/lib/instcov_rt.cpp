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

#include <cstdlib>
#include <cstring>
#include <iostream>
#include <fstream>
#include <string>
#include "instcov_rt.h"

std::string GenDumpFileName(void) {
  std::string DumpFile;
  if (char *env_file_name = getenv("INSTCOV_FILE")) {
    DumpFile = env_file_name;
  } else {
    DumpFile = "dump.instcov";
  }
  return DumpFile;
}

bool IsBinaryMode(void) {
  char *env_binary_mode = getenv("INSTCOV_BINARY_MODE");
  if (env_binary_mode&&
      (!strcmp(env_binary_mode, "YES") || !strcmp(env_binary_mode, "TRUE"))) {
    return true;
  }
  return false;
}

namespace {
static class InstCovLogger {
 public:
  InstCovLogger(void) {
    TraceFile.open(GenDumpFileName().c_str());
    BinaryMode = IsBinaryMode();
  }

  ~InstCovLogger(void) {
    TraceFile.close();
  }
  
  void LogText(uint64_t id_high, uint64_t id_low, uint64_t bid) {
    TraceFile << "(" << std::hex << "0x" << id_high << id_low  << ", "
              << std::dec << bid << ")\n";
  }

  void LogBinary(uint64_t id_high, uint64_t id_low, uint64_t bid) {
    TraceFile.write((char*)&id_high, sizeof(id_high));
    TraceFile.write((char*)&id_low, sizeof(id_low));
    TraceFile.write((char*)&bid, sizeof(bid));
  }
  
  void Log(uint64_t id_high, uint64_t id_low, uint64_t bid) {
    if (BinaryMode) {
      LogBinary(id_high, id_low, bid);
    } else {
      LogText(id_high, id_low, bid);
    }
  }

 private:
  std::ofstream TraceFile;
  bool BinaryMode;
} staInstCovLogger;

}

void instcov_dump(uint64_t id_high, uint64_t id_low, uint64_t bid) {
  staInstCovLogger.Log(id_high, id_low, bid);
}

