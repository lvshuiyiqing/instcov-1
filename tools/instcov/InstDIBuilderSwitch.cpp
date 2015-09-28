//===- InstDIBuilderSwitch.cpp - InstDIBuilderSwitch definition -*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for the switch instrumenter
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/raw_ostream.h"
#include "clang/Basic/SourceManager.h"
#include "InstDIBuilderSwitch.h"

using namespace instcov;
using namespace clang;

void InstDIBuilderSwitch::registerSwitch(const clang::SwitchStmt *s,
                                         const clang::SourceManager &SM) {
  if (Switch2Uuid.count(s) == 1) {
    llvm::errs() << "ERR: the function has already been registered, "
                 << "why another?\n";
    exit(1);
  }
  UUID_t Uuid = regAndGetUUID(s);
  LocInfo Loc;
  PresumedLoc PLoc = SM.getPresumedLoc(s->getLocStart());
  Loc.File = PLoc.getFilename();
  Loc.Line = PLoc.getLine();
  Loc.Col = PLoc.getColumn();
  DIM.registerSwitchInfo(Uuid, Loc);
}

UUID_t InstDIBuilderSwitch::getSwitchUUID(const clang::SwitchStmt *s) const {
  if (Switch2Uuid.count(s) == 0) {
    return UUID_t();
  }
  return Switch2Uuid.find(s)->second;
}

UUID_t InstDIBuilderSwitch::regAndGetUUID(const clang::SwitchStmt *s) {
  UUID_t Uuid;
  if (s) {
    if (Switch2Uuid.count(s) == 0) {
      Switch2Uuid[s] = genUUID();
    }
    Uuid = Switch2Uuid[s];
  }
  return Uuid;
}
