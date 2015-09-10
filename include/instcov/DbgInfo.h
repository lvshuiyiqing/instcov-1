//===-- DbgInfo.h --------------- DbgInfo classes ---------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for location info
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DBGINFO_H_
#define INSTCOV_DBGINFO_H_

#include <string>
#include <iostream>
#include "llvm/Support/Casting.h"
#include "instcov/uuid.h"

namespace instcov {
struct LocInfo {
  LocInfo(void)
      : Line(0), Col(0) {}
  LocInfo(const std::string &file, unsigned line, unsigned col)
      : File(file), Line(line), Col(col) {}

  std::string toString(void) const;

  std::string File;
  uint64_t Line;
  uint64_t Col;
};

struct DbgInfo {
 public:
  enum DIKind {
    DIK_DC,
    DIK_FUNC,
  };
  DbgInfo(DIKind kind)
      : Kind(kind), Loc(), Uuid() {}
  DbgInfo(DIKind kind, const LocInfo &loc, UUID_t uuid)
      : Kind(kind), Loc(loc), Uuid(uuid) {}
  virtual ~DbgInfo(void) {}

  // returns the written size
  virtual void dump2File(std::ostream &OS) const;
  DIKind getKind(void) const { return Kind; }
 private:
  const DIKind Kind;

 public:
  LocInfo Loc;
  UUID_t Uuid;
};

struct DbgInfo_DC : public DbgInfo {
  DbgInfo_DC(void)
      : DbgInfo(DIK_DC), Uuid_P() {}
  DbgInfo_DC(const LocInfo &loc, UUID_t uuid, UUID_t uuid_p)
      : DbgInfo(DIK_DC, loc, uuid), Uuid_P(uuid_p) {}

  virtual void dump2File(std::ostream &OS) const;

  UUID_t Uuid_P;
  std::vector<UUID_t> Children;
  static bool classof(const DbgInfo *DI) {
    return DI->getKind() == DIK_DC;
  }
};

struct DbgInfo_Func : public DbgInfo {
  DbgInfo_Func(void)
      : DbgInfo(DIK_FUNC), FuncName() {}
  DbgInfo_Func(const LocInfo &loc, UUID_t uuid, const std::string &funcName)
      : DbgInfo(DIK_FUNC, loc, uuid), FuncName(funcName) {}

  virtual void dump2File(std::ostream &OS) const;

  std::string FuncName;

  static bool classof(const DbgInfo *DI) {
    return DI->getKind() == DIK_FUNC;
  }
};
}


#endif  // INSTCOV_DBGINFO_H_
