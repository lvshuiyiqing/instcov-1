//===-- DIBuilder4Inst.cpp ----- DIBuilder4Inst declaration -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for the instrumenter
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/raw_ostream.h"
#include "clang/Basic/SourceManager.h"
#include "InstDIBuilderDC.h"

using namespace llvm;
using namespace clang;
using namespace instcov;

void InstDIBuilderDC::registerDC(const Stmt *c, const Stmt *p,
                                  const SourceManager &SM) {
  UUID_t Uuid = regAndGetUUID(c);
  UUID_t Uuid_P = regAndGetUUID(p);
  LocInfo Loc;
  PresumedLoc PLoc = SM.getPresumedLoc(c->getLocStart());
  Loc.File = PLoc.getFilename();
  Loc.Line = PLoc.getLine();
  Loc.Col = PLoc.getColumn();
  DIM.registerInfoDC(Uuid, Uuid_P, Loc);
}

UUID_t InstDIBuilderDC::regAndGetUUID(const Stmt *s) {
  UUID_t Uuid;
  if (s) {
    if (Stmt2Uuid.count(s) == 0) {
      Stmt2Uuid[s] = genUUID();
    }
    Uuid = Stmt2Uuid[s];
  }
  return Uuid;
}

UUID_t InstDIBuilderDC::getDCUUID(const clang::Stmt *s) const {
  if (Stmt2Uuid.count(s) == 0) {
    return UUID_t();
  }
  return Stmt2Uuid.find(s)->second;
}
