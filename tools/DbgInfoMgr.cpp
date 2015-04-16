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
#include "clang/Basic/SourceManager.h"
#include "clang/AST/Stmt.h"
#include "instcov/DbgInfoMgr.h"
#include "instcov/uuid.h"

using namespace instcov;
using namespace llvm;
using namespace clang;

namespace {
const char INSTCOV_MAGIC[] = "INSTCOV";
const char INSTCOV_VERSION[] = "1";
}

DbgInfoMgr::DbgInfoMgr(StringRef MainFileName) {
  std::error_code EC;
  StringRef DbgFileName = MainFileName.str() + ".dbginfo";
  File = new raw_fd_ostream(DbgFileName, EC, llvm::sys::fs::F_None);
  if (EC) {
    llvm::errs() << "cannot open debug info file, exiiting\n";
    exit(1);
  }
}

DbgInfoMgr::~DbgInfoMgr(void) {
  dump();
  delete File;
}

void DbgInfoMgr::registerStmt(const Stmt *s, const Stmt *p, const SourceManager &SM) {
  if (DbgInfo.count(s) && DbgInfo[s].P != nullptr) {
    llvm::errs() << "this statement already has a parent, why another?\n";
    exit(1);
  }
  if (DbgInfo.count(s) == 0) {
    StoreOrder.push_back(s);
  }
  DbgInfo[s].P = p;
  DbgInfo[p].Children.push_back(s);
  if (!DbgInfo[s].UUID.isValid()) {
    DbgInfo[s].UUID = genUUID();
    DbgInfo[s].File = SM.getFilename(s->getLocStart());
    DbgInfo[s].Line = SM.getSpellingLineNumber(s->getLocStart());
    DbgInfo[s].Col = SM.getSpellingColumnNumber(s->getLocStart());
  }
  if (p && !DbgInfo[p].UUID.isValid()) {
    DbgInfo[p].UUID = genUUID();
    DbgInfo[s].File = SM.getFilename(p->getLocStart());
    DbgInfo[s].Line = SM.getSpellingLineNumber(p->getLocStart());
    DbgInfo[s].Col = SM.getSpellingColumnNumber(p->getLocStart());
  }
}

UUID DbgInfoMgr::getUUID(const Stmt *s) const {
  if (DbgInfo.count(s) == 0) {
    llvm::errs() << "this statement has not been registered\n";
    exit(1);
  }
  return DbgInfo.find(s)->second.UUID;
}

void DbgInfoMgr::dump(void) {
  File->write(INSTCOV_MAGIC, sizeof(INSTCOV_MAGIC)-1);
  File->write(INSTCOV_VERSION, sizeof(INSTCOV_VERSION)-1);
  for (auto it = StoreOrder.begin(), ie = StoreOrder.end();
       it != ie; ++it) {
    dumpOne(*it);
  }
}

void DbgInfoMgr::dumpOne(const Stmt *s) {
  File->write((const char*)&(DbgInfo[s].UUID), sizeof(UUID));
  File->write((const char*)&(DbgInfo[DbgInfo[s].P].UUID), sizeof(UUID));
  *File << DbgInfo[s].File;
  File->write((const char*)&DbgInfo[s].Line, sizeof(DbgInfoEntry::Line));
  File->write((const char*)&DbgInfo[s].Col, sizeof(DbgInfoEntry::Col));
}
