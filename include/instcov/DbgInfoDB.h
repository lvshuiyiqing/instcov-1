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
#include "llvm/ADT/StringRef.h"
#include "instcov/uuid.h"

namespace instcov {

class DbgInfoEntry_View {
 public:
  DbgInfoEntry_View(void)
      : P(0), Line(0), Col(0) {}

 public:
  DbgInfoEntry_View *toRoot(void);
  void dump(void);
  
 public:
  UUID Uuid;
  std::vector<DbgInfoEntry_View *> Children;
  DbgInfoEntry_View *P;
  llvm::StringRef File;
  uint64_t Line;
  uint64_t Col;
};

class DbgInfoDB {
 public:
  DbgInfoDB(void);
  ~DbgInfoDB(void);

 private:
  DbgInfoDB(const DbgInfoDB &from);
  const DbgInfoDB &operator = (const DbgInfoDB &right);

 public:
  void loadFile(const std::string &FileName);
  bool selfCheck(void) const;

 private:
  void registerEntry(const DbgInfoEntry_View &Entry, UUID &P_Uuid);
  
 public:
  std::map<UUID, DbgInfoEntry_View *> Entries;
};
}

#endif  // INSTCOV_DBGINFODB_H_
