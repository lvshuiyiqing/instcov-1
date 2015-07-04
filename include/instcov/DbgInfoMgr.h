//===-- DbgInfoMgr.h ------ debug info manager declaration ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the debug info manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DBGINFOMGR_H_
#define INSTCOV_DBGINFOMGR_H_

#include <vector>
#include <map>
#include <set>
#include <string>
#include <iostream>
#include "instcov/DbgInfo.h"

namespace instcov {
class DbgInfoMgr {
 public:
  DbgInfoMgr(void);
  ~DbgInfoMgr(void);

 private:
  DbgInfoMgr(const DbgInfoMgr &right);
  const DbgInfoMgr &operator = (const DbgInfoMgr &right);
  
 public:
  virtual void registerInfo(UUID_t c, UUID_t p, const LocInfo &loc);

  const DbgInfo &getDbgInfo(UUID_t Uuid) const {
    return DbgInfos.find(Uuid)->second;
  }
  const std::map<UUID_t, DbgInfo> &getDbgInfos(void) const {
    return DbgInfos;
  }
  bool isExist(UUID_t Uuid) const {
    return RegisteredUuids.count(Uuid);
  }
  void dump(const std::string &MainFileName) const;
  bool selfCheck(void) const;
  std::size_t getNumNodes(UUID_t Uuid) const;

 private:
  void dumpOne(std::ostream &File, UUID_t Uuid) const;

 private:
  std::map<UUID_t, DbgInfo> DbgInfos;
  std::set<UUID_t> RegisteredUuids;
  std::vector<UUID_t> QueueOrder;
};
}

#endif  // INSTCOV_DBGINFOMGR_H_
