//===-- LogMgr.h ------ trace log manager class -----------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for trace log manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_LOGMGR_H_
#define INSTCOV_LOGMGR_H_

#include <string>
#include <map>
#include <set>
#include <memory>
#include <vector>
#include "instcov/uuid.h"

namespace instcov {

class LogEntry {
 public:
  LogEntry(void)
      : FID(-1), RID(-1) {}

  std::map<UUID, uint64_t> Conditions;
  std::pair<UUID, uint64_t> Decision;
  unsigned FID;
  unsigned RID;
};

class LogMgr {
 public:
  LogMgr(void);
  ~LogMgr(void);

 private:
  LogMgr(const LogMgr &from);
  const LogMgr &operator = (const LogMgr &right);

 public:
  void loadFile(const std::string &fileName);

  const std::vector<std::string> &getFileNames() const {
    return FileNames;
  }
  
  const std::vector<LogEntry> &getLogEntries() const {
    return LogEntries;
  }
  
  const std::map<UUID, std::set<UUID> > &getChildren() const {
    return Children;
  }
  
 private:
  std::vector<std::string> FileNames;
  std::vector<LogEntry> LogEntries;
  std::map<UUID, std::set<UUID> > Children;
};
}

#endif  // INSTCOV_LOGMGR_H_
