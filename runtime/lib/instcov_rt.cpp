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
#include <signal.h>
#ifndef WIN32
#include <sys/types.h>
#include <unistd.h>
#endif  // WIN32
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
    BinaryMode = IsBinaryMode();
    if (BinaryMode) {
      TraceFile.open(GenDumpFileName().c_str(), std::ios::binary);
    } else {
      TraceFile.open(GenDumpFileName().c_str());
    }
    LogMagic();
  }

  ~InstCovLogger(void) {
    TraceFile.close();
  }

  void LogMagic(void) {
    TraceFile.write(INSTCOV_DUMP_MAGIC, sizeof(INSTCOV_DUMP_MAGIC)-1);
    TraceFile.write(INSTCOV_DUMP_VERSION, sizeof(INSTCOV_DUMP_VERSION)-1);
    const uint64_t Padding = 0;
    std::size_t PaddingSize =
        sizeof(Padding)
        - (sizeof(INSTCOV_DUMP_MAGIC) - 1 + sizeof(INSTCOV_DUMP_VERSION) - 1)
        % sizeof(Padding);
    if (PaddingSize) {
      TraceFile.write((const char *)&Padding, PaddingSize);
    }
  }
  
  void LogText(uint64_t id_high, uint64_t id_low, uint64_t bid) {
    TraceFile << "(" << std::hex << "0x" << id_high << id_low  << ", "
              << std::dec << bid << ")\n";
  }

  void LogBinary(uint64_t id_high, uint64_t id_low, uint64_t bid) {
    TraceFile.write((const char *)&id_high, sizeof(id_high));
    TraceFile.write((const char *)&id_low, sizeof(id_low));
    TraceFile.write((const char *)&bid, sizeof(bid));
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


void sighandler(int signo)
{
  std::cout << "instcov: caught signal " << signo << ", exiting & dumping trace"
            << std::endl;
  exit(signo);
}

static class SigHandler {
 public:
  SigHandler(void) {
    char *env_no_sighandler = getenv("INSTCOV_NO_SIGHANDLER");
    if (env_no_sighandler &&
        (strcmp(env_no_sighandler, "YES") ||
         strcmp(env_no_sighandler, "TRUE"))) {
      return;
    }
#ifndef WIN32
    int sigs[] = {
      SIGILL, SIGFPE, SIGABRT, SIGBUS,
      SIGSEGV, SIGHUP, SIGINT, SIGQUIT,
      SIGTERM
    };
    struct sigaction new_action;
    new_action.sa_handler = sighandler;
    sigemptyset(&new_action.sa_mask);
    new_action.sa_flags = SA_RESETHAND;
    for(std::size_t i = 0; i < sizeof(sigs)/sizeof(sigs[0]); ++i) {
      if (sigaction(sigs[i], &new_action, NULL) == -1) {
        perror("Failed: couldnot set signal handler");
      }
    }
#else  // WIN32
    signal(SIGABRT, sighandler);
    signal(SIGFPE, sighandler);
    signal(SIGILL, sighandler);
    signal(SIGINT, sighandler);
    signal(SIGSEGV, sighandler);
    signal(SIGTERM, sighandler);
#endif  // WIN32
  }
} staSigHandler;
}

void instcov_dump(uint64_t id_high, uint64_t id_low, uint64_t bid) {
  staInstCovLogger.Log(id_high, id_low, bid);
}

