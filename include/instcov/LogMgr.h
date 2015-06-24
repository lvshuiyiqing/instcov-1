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
#include "instcov/DbgInfo.h"

namespace instcov {

const uint64_t BID_NA = ~(~((uint64_t)0)>>1);

class LogEntry {
 public:
  LogEntry(void)
      : TID(-1), VID(-1) {}

  std::map<UUID_t, uint64_t> Conditions;
  std::pair<UUID_t, uint64_t> Decision;
  std::size_t TID;
  std::size_t VID;
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
  
  const std::map<UUID_t, std::set<UUID_t> > &getChildren() const {
    return Children;
  }

  const std::map<UUID_t, LocInfo> &getLocInfos() const {
    return LocInfos;
  }
  
 private:
  std::vector<std::string> FileNames;
  std::vector<LogEntry> LogEntries;
  std::map<UUID_t, std::set<UUID_t> > Children;
  std::map<UUID_t, LocInfo> LocInfos;
};
}

#endif  // INSTCOV_LOGMGR_H_
