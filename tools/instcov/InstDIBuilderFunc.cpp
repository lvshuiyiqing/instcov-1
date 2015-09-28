//===-- InstDIBuilderFunc.cpp --- InstDIBuilderFunc definition --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for the Func instrumenter
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/raw_ostream.h"
#include "clang/Basic/SourceManager.h"
#include "InstDIBuilderFunc.h"

using namespace instcov;
using namespace clang;

void InstDIBuilderFunc::registerFunc(const clang::FunctionDecl *d,
                                     const clang::SourceManager &SM) {
  if (Func2Uuid.count(d) == 1) {
    llvm::errs() << "ERR: the function has already been registered, "
                 << "why another?\n";
    exit(1);
  }
  if (!d->hasBody()) {
    llvm::errs() << "ERR: the function to be registered does not have body\n";
    exit(1);
  }
  UUID_t Uuid = regAndGetUUID(d);
  LocInfo Loc;
  PresumedLoc PLoc = SM.getPresumedLoc(d->getLocStart());
  Loc.File = PLoc.getFilename();
  Loc.Line = PLoc.getLine();
  Loc.Col = PLoc.getColumn();
  DIM.registerFuncInfo(Uuid, d->getNameInfo().getAsString(), Loc);
}

UUID_t InstDIBuilderFunc::getFuncUUID(const clang::FunctionDecl *d) const {
  if (Func2Uuid.count(d) == 0) {
    return UUID_t();
  }
  return Func2Uuid.find(d)->second;
}

UUID_t InstDIBuilderFunc::regAndGetUUID(const clang::FunctionDecl *d) {
  UUID_t Uuid;
  if (d) {
    if (Func2Uuid.count(d) == 0) {
      Func2Uuid[d] = genUUID();
    }
    Uuid = Func2Uuid[d];
  }
  return Uuid;
}
