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
#include <vector>
#include <iostream>
#include <tuple>
#include <map>
#include "llvm/ADT/StringMap.h"
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

struct RawRecord;

struct DbgInfo {
 public:
  class Builder;
  enum DIKind {
    DIK_DC,
    DIK_SWITCH,
    DIK_FUNC,
  };

  static const std::size_t MAGIC_SIZE = 4;

  DbgInfo(DIKind kind)
      : Kind(kind), Loc(), Uuid() {}
  DbgInfo(DIKind kind, const LocInfo &loc, UUID_t uuid)
      : Kind(kind), Loc(loc), Uuid(uuid) {}
  virtual ~DbgInfo(void) {}

  // returns the written size
  virtual void dump2File(std::ostream &OS) const;
  static DbgInfo *loadFromFile(std::istream &File);
  static RawRecord *loadRawRecord(std::istream &File);
  virtual RawRecord *createRawRecord(void) const = 0;
  virtual void loadBodyFromFile(std::istream &File) = 0;
  virtual const char *getMagic(void) const = 0;
  DIKind getKind(void) const { return Kind; }
  virtual void dumpPretty(std::ostream &OS) const = 0;
 private:
  const DIKind Kind;

 public:
  LocInfo Loc;
  UUID_t Uuid;
};

class DbgInfo::Builder {
 private:
  Builder(void) {}
 public:
  static Builder &getBuilder(void) {
    static Builder staInstance;
    return staInstance;
  }
  typedef DbgInfo *(*create_func_t)(void);
  void registerCreateFunc(const std::string &magic, create_func_t func) {
    RegisteredCreateFuncs[magic] = func;
  }
  bool has(const std::string &magic) const {
    return RegisteredCreateFuncs.count(magic);
  }
  DbgInfo *createDbgInfo(const std::string &magic) const {
    return (*(RegisteredCreateFuncs.find(magic)->second))();
  }
 private:
  llvm::StringMap<create_func_t> RegisteredCreateFuncs;
};

// Call this macro exactly once in a cpp file for each DbgInfo leaf class
#define REGISTER_DBGINFO_CREATOR(Class)                                 \
  namespace {                                                           \
  struct Register##Class {                                              \
   public:                                                              \
   Register##Class(void) {                                              \
     DbgInfo::Builder::getBuilder().registerCreateFunc(                 \
         Class::magic(), &createDbgInfo);                               \
   }                                                                    \
   static DbgInfo *createDbgInfo(void) {                                \
     return new Class();                                                \
   }                                                                    \
  } staRegister##Class;                                                 \
  }

struct CmpDbgInfoLoc {
  bool operator () (const DbgInfo *left,
                    const DbgInfo *right) {
    return std::make_tuple(left->Loc.File,
                           left->Loc.Line,
                           left->Loc.Col) <
           std::make_tuple(right->Loc.File,
                           right->Loc.Line,
                           right->Loc.Col);
  }
};

struct DbgInfo_DC : public DbgInfo {
  DbgInfo_DC(void)
      : DbgInfo(DIK_DC), Uuid_P() {}
  DbgInfo_DC(const LocInfo &loc, UUID_t uuid, UUID_t uuid_p)
      : DbgInfo(DIK_DC, loc, uuid), Uuid_P(uuid_p) {}

  virtual void dump2File(std::ostream &OS) const;
  virtual void loadBodyFromFile(std::istream &File);
  virtual RawRecord *createRawRecord(void) const;
  static bool classof(const DbgInfo *DI) {
    return DI->getKind() == DIK_DC;
  }
  virtual const char *getMagic(void) const {
    return magic();
  }
  static const char *magic(void) {
    static const char MAGIC[] = "DCDC";
    return MAGIC;
  }
  virtual void dumpPretty(std::ostream &OS) const;

  UUID_t Uuid_P;
  std::vector<UUID_t> Children;
};

struct DbgInfo_Switch : public DbgInfo {
  DbgInfo_Switch(void)
      : DbgInfo(DIK_SWITCH) {}
  DbgInfo_Switch(const LocInfo &loc, UUID_t uuid)
      : DbgInfo(DIK_SWITCH, loc, uuid) {}

  virtual void dump2File(std::ostream &OS) const;
  virtual void loadBodyFromFile(std::istream &File);
  virtual RawRecord *createRawRecord(void) const;

  static bool classof(const DbgInfo *DI) {
    return DI->getKind() == DIK_SWITCH;
  }
  virtual const char *getMagic(void) const {
    return magic();
  }
  static const char *magic(void) {
    static const char MAGIC[] = "SWTH";
    return MAGIC;
  }
  virtual void dumpPretty(std::ostream &OS) const;
};

struct DbgInfo_Func : public DbgInfo {
  DbgInfo_Func(void)
      : DbgInfo(DIK_FUNC), FuncName() {}
  DbgInfo_Func(const LocInfo &loc, UUID_t uuid, const std::string &funcName)
      : DbgInfo(DIK_FUNC, loc, uuid), FuncName(funcName) {}

  virtual void dump2File(std::ostream &OS) const;
  virtual void loadBodyFromFile(std::istream &File);
  virtual RawRecord *createRawRecord(void) const;

  static bool classof(const DbgInfo *DI) {
    return DI->getKind() == DIK_FUNC;
  }
  virtual const char *getMagic(void) const {
    return magic();
  }
  static const char *magic(void) {
    static const char MAGIC[] = "FUNC";
    return MAGIC;
  }
  virtual void dumpPretty(std::ostream &OS) const;

  std::string FuncName;
};
}


#endif  // INSTCOV_DBGINFO_H_
