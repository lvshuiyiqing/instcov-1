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

#include "llvm/ADT/StringRef.h"
#include "llvm/Support/raw_ostream.h"

#include "instcov/uuid.h"
#include <vector>
#include <map>
#include <set>
#include <string>

namespace clang {
class Stmt;
class SourceManager;
}

namespace instcov {
class DbgInfoEntry {
 public:
  DbgInfoEntry(void)
      : Line(0), Col(0) {}
  DbgInfoEntry(const std::string &file, unsigned line, unsigned col)
      : File(file), Line(line), Col(col) {}
  
 public:
  std::string File;
  uint64_t Line;
  uint64_t Col;
};

class DbgInfoMgr {
 public:
  DbgInfoMgr(llvm::StringRef MainFileName);
  ~DbgInfoMgr(void);

 private:
  DbgInfoMgr(const DbgInfoMgr &right);
  const DbgInfoMgr &operator = (const DbgInfoMgr &right);
  
 public:
  void registerStmt(const clang::Stmt *s, const clang::Stmt *p, const
                    clang::SourceManager &SM);
  instcov::UUID_t getUUID(const clang::Stmt *s) const;

 private:
  void dumpOne(const clang::Stmt *s);
  void dump(void);

 private:
  std::map<const clang::Stmt *, DbgInfoEntry> DbgInfo;
  std::map<const clang::Stmt *, instcov::UUID_t> UuidInfo;
  std::map<const clang::Stmt *, const clang::Stmt *> ParentInfo;
  std::vector<const clang::Stmt *> QueueOrder;
  std::auto_ptr<llvm::raw_fd_ostream> File;
};
}

#endif  // INSTCOV_DBGINFOMGR_H_
