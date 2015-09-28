//===-- DbgInfoDB.h ------ debug info database declaration ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the debug info database
/// for analysis trace file
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DBGINFODB_H_
#define INSTCOV_DBGINFODB_H_

#include <vector>
#include <map>
#include <string>
#include <iostream>
#include "instcov/DbgInfoMgr.h"

namespace instcov {

class DIBuilder4View : private DbgInfoMgr {
 public:
  DIBuilder4View(void);
  ~DIBuilder4View(void);

 private:
  DIBuilder4View(const DIBuilder4View &from);
  const DIBuilder4View &operator = (const DIBuilder4View &right);

 public:
  void loadFile(const std::string &FileName);
  uint64_t getSID(UUID_t Uuid) const {
    return Uuid2SID.find(Uuid)->second;
  }

  virtual void registerInfo(UUID_t c, UUID_t p, const LocInfo &loc);

  using DbgInfoMgr::dump;
  using DbgInfoMgr::selfCheck;
  using DbgInfoMgr::getDbgInfo;
  using DbgInfoMgr::getNumNodes;
  using DbgInfoMgr::isExist;

 private:
  void dumpPrettyDFS(std::ostream &os, UUID_t Uuid, std::size_t depth) const;
  void allocateSID(UUID_t Uuid);

 private:
  std::map<UUID_t, size_t> Uuid2SID;
};

#endif  // INSTCOV_DBGINFODB_H_
