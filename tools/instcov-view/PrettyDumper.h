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

#ifndef INSTCOV_PRETTYDUMPER_H_
#define INSTCOV_PRETTYDUMPER_H_

#include <vector>
#include <map>
#include <string>
#include <iostream>
#include "instcov/DbgInfoMgr.h"
#include "instcov/RawRecordMgr.h"
#include "instcov/RecordMgr.h"
#include "instcov/LogMgr.h"

namespace instcov {

class PrettyDumper {
 public:
  PrettyDumper(const DbgInfoMgr &dim);
  ~PrettyDumper(void);

 private:
  PrettyDumper(const PrettyDumper &from);
  const PrettyDumper &operator = (const PrettyDumper &right);

 public:
  bool isSIDExist(UUID_t Uuid) const {
    return Uuid2SID.count(Uuid);
  }
  uint64_t getSID(UUID_t Uuid) const {
    return Uuid2SID.find(Uuid)->second;
  }

  void dumpTracePretty(std::ostream &OS, const RawRecordMgr &RRM) const;
  void dumpTracePrettyDC(std::ostream &OS, const RecordMgr &RM) const;
  void dumpDIPretty(std::ostream &OS) const;
  void dumpDIPrettyDC(std::ostream &OS) const;

 private:
  void dumpLogEntryPrettyDC(std::ostream &OS, const LogEntry &LE) const;
  void dumpLogEntryItemPrettyDC(std::ostream &OS, std::size_t depth,
                            const std::pair<UUID_t, uint64_t> &DC) const;
  void dumpDIPrettyDC_DFS(std::ostream &OS, UUID_t Uuid, std::size_t depth) const;
  void allocateSID(UUID_t Uuid);
  void allocateAllSIDs(void);

  const DbgInfoMgr &DIM;
  std::map<UUID_t, size_t> Uuid2SID;
};
}

#endif  // INSTCOV_PRETTYDUMPER_H_
