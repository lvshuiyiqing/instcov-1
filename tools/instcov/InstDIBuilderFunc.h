//===-- InstDIBuilderFunc.h --- InstDIBuilderFunc declaration ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the Func instrumenter
///
//===----------------------------------------------------------------------===//

#ifndef INSTDIBUILDERFUNC_H_
#define INSTDIBUILDERFUNC_H_

#include <map>
#include "instcov/DbgInfoMgr.h"
#include "clang/AST/Decl.h"

namespace instcov {
class DbgInfoMgr;
class InstDIBuilderFunc {
 public:
  InstDIBuilderFunc(DbgInfoMgr &dim)
      : DIM(dim) {}
  ~InstDIBuilderFunc(void) {}

 private:
  InstDIBuilderFunc(const InstDIBuilderFunc &from);
  const InstDIBuilderFunc &operator = (const InstDIBuilderFunc &right);

 public:
  // should be the one with the function body
  void registerFunc(const clang::FunctionDecl *d,
                    const clang::SourceManager &SM);
  UUID_t getFuncUUID(const clang::FunctionDecl *d) const;

  DbgInfoMgr &getDIM(void) { return DIM; }

 private:
  UUID_t regAndGetUUID(const clang::FunctionDecl *d);

 private:
  std::map<const clang::FunctionDecl *, UUID_t> Func2Uuid;
  DbgInfoMgr &DIM;
};
}

#endif  // INSTDIBUILDERFUNC_H_
