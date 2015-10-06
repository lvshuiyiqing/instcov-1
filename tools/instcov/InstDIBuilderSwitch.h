//===-- InstDIBuilderSwitch.h - InstDIBuilderSwitch declaration -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the switch instrumenter
///
//===----------------------------------------------------------------------===//

#ifndef INSTDIBUILDERSWITCH_H_
#define INSTDIBUILDERSWITCH_H_

#include <map>
#include "instcov/DbgInfoMgr.h"
#include "clang/AST/Stmt.h"

namespace instcov {
class DbgInfoMgr;
class InstDIBuilderSwitch {
 public:
  InstDIBuilderSwitch(DbgInfoMgr &dim)
      : DIM(dim) {}
  ~InstDIBuilderSwitch(void) {}

 private:
  InstDIBuilderSwitch(const InstDIBuilderSwitch &from);
  const InstDIBuilderSwitch &operator = (const InstDIBuilderSwitch &right);

 public:
  void registerSwitch(const clang::SwitchStmt *s,
                      const clang::SourceManager &SM);
  UUID_t getSwitchUUID(const clang::SwitchStmt *s) const;

  DbgInfoMgr &getDIM(void) { return DIM; }

 private:
  UUID_t regAndGetUUID(const clang::SwitchStmt *s);

 private:
  std::map<const clang::SwitchStmt *, UUID_t> Switch2Uuid;
  DbgInfoMgr &DIM;
};
}

#endif  // INSTDIBUILDERSWITCH_H_
