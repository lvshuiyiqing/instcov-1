//===-- DIBuilder4Inst.h ------- DIBuilder4Inst declaration -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the instrumenter
///
//===----------------------------------------------------------------------===//

#ifndef DIBUILDER4INST_H_
#define DIBUILDER4INST_H_

#include <map>
#include "instcov/DbgInfoMgr.h"
#include "clang/AST/Stmt.h"

namespace instcov {
class DIBuilder4Inst : private DbgInfoMgr {
 public:
  DIBuilder4Inst(void) {}
  ~DIBuilder4Inst(void) {}

 private:
  DIBuilder4Inst(const DIBuilder4Inst &from);
  const DIBuilder4Inst &operator = (const DIBuilder4Inst &right);

 public:
  void registerStmt(const clang::Stmt *c, const clang::Stmt *p,
                    const clang::SourceManager &SM);
  UUID_t getUUID(const clang::Stmt *s) const;

  using DbgInfoMgr::dump;
  using DbgInfoMgr::selfCheck;
  using DbgInfoMgr::getDbgInfo;
  using DbgInfoMgr::getNumNodes;
  using DbgInfoMgr::isExist;

 private:
  UUID_t regAndGetUUID(const clang::Stmt *s);

 private:
  std::map<const clang::Stmt *, UUID_t> Stmt2Uuid;
};
}

#endif  // DIBUILDER4INST_H_
