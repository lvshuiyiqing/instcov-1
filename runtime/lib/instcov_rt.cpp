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

namespace {
const char INSTCOV_DUMP_MAGIC[] = "INSTCOV_DUMP";
const char INSTCOV_DUMP_VERSION[] = "1";

}

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
  char *env_text_mode = getenv("INSTCOV_TEXT_MODE");
  if (env_text_mode&&
      (!strcmp(env_text_mode, "YES") || !strcmp(env_text_mode, "TRUE"))) {
    return false;
  }
  return true;
}

namespace {
static class InstCovLogger {
 public:
  InstCovLogger(void) {
    TraceFile.open(GenDumpFileName().c_str());
    BinaryMode = IsBinaryMode();
    LogMagic();
  }

  ~InstCovLogger(void) {
    TraceFile.close();
  }

  void LogMagic(void) {
    TraceFile.write(INSTCOV_DUMP_MAGIC, sizeof(INSTCOV_DUMP_MAGIC)-1);
    TraceFile.write(INSTCOV_DUMP_VERSION, sizeof(INSTCOV_DUMP_VERSION)-1);
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

