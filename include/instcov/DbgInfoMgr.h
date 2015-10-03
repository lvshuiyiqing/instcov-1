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

  const std::set<UUID_t> &getRegisteredDCs(void) const {
    return RegisteredDCs;
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
  void registerDCParent(UUID_t c, UUID_t p);
  void dumpOne(std::ostream &File, UUID_t Uuid) const;
  void loadOne(std::istream &File);

 private:
  std::map<UUID_t, DbgInfo*> DbgInfos;
  std::set<UUID_t> RegisteredUuids;
  std::set<UUID_t> RegisteredDCs;
  std::vector<UUID_t> QueueOrder;
};

struct LocSorter {
 public:
  LocSorter(const DbgInfoMgr &dim)
      : DIM(dim) {}
  template<typename T>
  bool operator()(const T &LHS, const T &RHS) const {
    if (!DIM.isExist(LHS->first)) {
      return true;
    }
    if (!DIM.isExist(RHS->first)) {
      return false;
    }
    const LocInfo &LHS_LI = DIM.getDbgInfo(LHS->first)->Loc;
    const LocInfo &RHS_LI = DIM.getDbgInfo(RHS->first)->Loc;
    return std::make_tuple(LHS_LI.File, LHS_LI.Line, LHS_LI.Col) <
      std::make_tuple(RHS_LI.File, RHS_LI.Line, RHS_LI.Col);
  }
 private:
  const DbgInfoMgr &DIM;
};

template<typename T>
std::vector<typename T::const_iterator>
getSortedIterators(const T &C, const DbgInfoMgr &DIM) {
  std::vector<typename T::const_iterator> vec;
  for (auto it = C.begin(), ie = C.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(DIM));
  return vec;
}
}

#endif  // INSTCOV_DBGINFOMGR_H_
