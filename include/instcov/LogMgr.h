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
#include <iostream>
#include <memory>
#include <vector>
#include <algorithm>
#include "instcov/uuid.h"
#include "instcov/DbgInfo.h"

namespace instcov {

const uint64_t BID_NA = ~(~((uint64_t)0)>>1);

class LogEntry {
 public:
  LogEntry(void)
      : TID(-1), VID(-1) {}

  void dump(std::ostream &OS) const;
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

  bool hasLocInfo(UUID_t Uuid) const {
    return LocInfos.count(Uuid);
  }
  
  const LocInfo &getLocInfo(UUID_t Uuid) const {
    return LocInfos.find(Uuid)->second;
  }
  
 private:
  std::vector<std::string> FileNames;
  std::vector<LogEntry> LogEntries;
  std::map<UUID_t, std::set<UUID_t> > Children;
  std::map<UUID_t, LocInfo> LocInfos;
};


struct LocSorter {
 public:
  LocSorter(const LogMgr &lm)
      : LM(lm) {}
  template<typename T>
  bool operator()(const T &LHS, const T &RHS) const {
    if (LM.getLocInfos().count(LHS->first) == 0) {
      return true;
    }
    if (LM.getLocInfos().count(RHS->first) == 0) {
      return false;
    }
    const LocInfo &LHS_LI = LM.getLocInfos().find(LHS->first)->second;
    const LocInfo &RHS_LI = LM.getLocInfos().find(RHS->first)->second;
    return std::make_tuple(LHS_LI.File, LHS_LI.Line, LHS_LI.Col) <
      std::make_tuple(RHS_LI.File, RHS_LI.Line, RHS_LI.Col);
  }
 private:
  const LogMgr &LM;
};

template<typename T>
std::vector<typename T::const_iterator>
getSortedIterators(const T &C, const LogMgr &LM) {
  std::vector<typename T::const_iterator> vec;
  for (auto it = C.begin(), ie = C.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(LM));
  return vec;
}

}

#endif  // INSTCOV_LOGMGR_H_
