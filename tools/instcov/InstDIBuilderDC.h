//===-- InstDIBuilderDC.h ----- InstDIBuilderDC declaration -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the DC instrumenter
///
//===----------------------------------------------------------------------===//

#ifndef INSTDIBUILDERDC_H_
#define INSTDIBUILDERDC_H_

#include <map>
#include "instcov/DbgInfoMgr.h"
#include "clang/AST/Stmt.h"

namespace instcov {
class DbgInfoMgr;
class InstDIBuilderDC {
 public:
  InstDIBuilderDC(DbgInfoMgr &dim)
      : DIM(dim) {}
  ~InstDIBuilderDC(void) {}

 private:
  InstDIBuilderDC(const InstDIBuilderDC &from);
  const InstDIBuilderDC &operator = (const InstDIBuilderDC &right);

 public:
  void registerDC(const clang::Stmt *c, const clang::Stmt *p,
                      const clang::SourceManager &SM);
  UUID_t getDCUUID(const clang::Stmt *s) const;

  DbgInfoMgr &getDIM(void) { return DIM; }

 private:
  UUID_t regAndGetUUID(const clang::Stmt *s);

 private:
  std::map<const clang::Stmt *, UUID_t> Stmt2Uuid;
  DbgInfoMgr &DIM;
};
}

#endif  // INSTDIBUILDERDC_H_
