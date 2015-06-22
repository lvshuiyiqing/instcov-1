//===-- ProblemGenerator.h ------- ProblemGenerator header ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the declaration for ProblemGenerator
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_PROBLEMGENERATOR_H_
#define INSTCOV_PROBLEMGENERATOR_H_

#include <map>
#include "instcov/LogMgr.h"
#include "llvm/ADT/StringMap.h"

namespace instcov {
class ProblemGenerator {
 public:
  ProblemGenerator(void);
  ~ProblemGenerator(void);

  void registerLogEntry(const LogEntry *E);

 private:
  // decision / conditions
  std::size_t encodeDC(
      std::size_t sid,
      std::size_t fid, std::size_t rid,
      char type);
  // test / visit ID
  std::size_t encodeTV(std::size_t id, char type);

  std::size_t encodeStr(const std::string &str);
  
 private:
  std::map<UUID_t, const LogEntry *> Uuid2LogEntries;
  std::map<UUID_t, std::size_t> Uuid2SID;
  std::vector<UUID_t> SID2Uuid;
  llvm::StringMap<std::size_t> IDPool;
  std::vector<std::string> ID2Str;
};
}

#endif  // INSTCOV_PROBLEMGENERATOR_H_
