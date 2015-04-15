//===-- DbgInfoMgr.cpp ----- debug info manager definitions -----*- C++ -*-===//
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

#include "llvm/Support/FileSystem.h"
#include "instcov/DbgInfoMgr.h"
#include "instcov/uuid.h"

using namespace instcov;
using namespace llvm;
using namespace clang;

DbgInfoMgr::DbgInfoMgr(StringRef MainFileName) {
  std::error_code EC;
  StringRef DbgFileName = MainFileName.str() + ".dbginfo";
  File = new raw_fd_ostream(DbgFileName, EC,
                            llvm::sys::fs::F_None);
  if (EC) {
    llvm::errs() << "cannot open debug info file, exiiting\n";
    exit(1);
  }
}

DbgInfoMgr::~DbgInfoMgr(void) {
  delete File;
}

void DbgInfoMgr::registerStmt(Stmt *s, Stmt *p) {
  if (DbgInfo.count(s) && DbgInfo[s].P != nullptr) {
    llvm::errs() << "this statement already has a parent, why another?\n";
    exit(1);
  }
  DbgInfo[s].P = p;
  DbgInfo[p].Children.push_back(s);
  if (!DbgInfo[s].UUID.isValid()) {
    DbgInfo[s].UUID = genUUID();
  }
  if (p && !DbgInfo[p].UUID.isValid()) {
    DbgInfo[p].UUID = genUUID();
  }
}

UUID DbgInfoMgr::getUUID(Stmt *s) const {
  if (DbgInfo.count(s) == 0) {
    llvm::errs() << "this statement has not been registered\n";
    exit(1);
  }
  return DbgInfo.find(s)->second.UUID;
}
