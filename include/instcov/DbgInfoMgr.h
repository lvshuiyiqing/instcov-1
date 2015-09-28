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
  void registerFuncInfo(UUID_t uuid, const std::string &funcName, const LocInfo &loc);
  void registerDCInfo(UUID_t c, UUID_t p, const LocInfo &loc);
  void registerSwitchInfo(UUID_t uuid, const LocInfo &loc);

  const DbgInfo_DC *getDbgInfoDC(UUID_t Uuid) const {
    return llvm::dyn_cast<const DbgInfo_DC>(DbgInfos.find(Uuid)->second);
  }
  DbgInfo_DC *theDbgInfoDC(UUID_t Uuid) {
    return llvm::dyn_cast<DbgInfo_DC>(DbgInfos.find(Uuid)->second);
  }
  const DbgInfo *getDbgInfo(UUID_t Uuid) const {
    return DbgInfos.find(Uuid)->second;
  }
  DbgInfo *theDbgInfo(UUID_t Uuid) {
    return DbgInfos.find(Uuid)->second;
  }

  const std::map<UUID_t, DbgInfo *> &getDbgInfos(void) const {
    return DbgInfos;
  }
  bool isExist(UUID_t Uuid) const {
    return RegisteredUuids.count(Uuid);
  }
  bool isDC(UUID_t Uuid) const {
    return RegisteredDCs.count(Uuid);
  }

  void dump(std::ostream &File) const;
  void load(std::istream &File);
  bool selfCheck4DC(void) const;
  std::size_t getNumNodes4DC(UUID_t Uuid) const;
  UUID_t toRoot4DC(UUID_t Uuid) const;

 private:
  void dumpOne(std::ostream &File, UUID_t Uuid) const;
  void loadOne(std::istream &File);

 private:
  std::map<UUID_t, DbgInfo*> DbgInfos;
  std::set<UUID_t> RegisteredUuids;
  std::set<UUID_t> RegisteredDCs;
  std::vector<UUID_t> QueueOrder;
};
}

#endif  // INSTCOV_DBGINFOMGR_H_
