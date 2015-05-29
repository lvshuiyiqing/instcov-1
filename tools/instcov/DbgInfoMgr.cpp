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
  std::string DbgFileName = MainFileName.str() + ".dbginfo";
  File.reset(new raw_fd_ostream(DbgFileName, EC, llvm::sys::fs::F_None));
  if (EC) {
    llvm::errs() << "cannot open debug info file, exiting\n";
    exit(1);
  }
}

DbgInfoMgr::~DbgInfoMgr(void) {
  dump();
}

void DbgInfoMgr::registerStmt(const Stmt *s, const Stmt *p, const SourceManager &SM) {
  if (UuidInfo.count(s)) {
    llvm::errs() << "this statement is already registered, why another?\n";
    exit(1);
  }
  ParentInfo[s] = p;
  UuidInfo[s] = genUUID();
  PresumedLoc PLoc = SM.getPresumedLoc(s->getLocStart());
  DbgInfo[s].File = PLoc.getFilename();
  DbgInfo[s].Line = PLoc.getLine();
  DbgInfo[s].Col = PLoc.getColumn();
  QueueOrder.push_back(s);
}

UUID_t DbgInfoMgr::getUUID(const Stmt *s) const {
  auto it = UuidInfo.find(s);
  if (it == UuidInfo.end()) {
    llvm::errs() << "this statement has not been registered\n";
    exit(1);
  }
  return it->second;
}

void DbgInfoMgr::dump(void) {
  File->write(INSTCOV_MAGIC, sizeof(INSTCOV_MAGIC)-1);
  File->write(INSTCOV_VERSION, sizeof(INSTCOV_VERSION)-1);
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding)
      - (sizeof(INSTCOV_MAGIC)-1 + sizeof(INSTCOV_VERSION)-1)
      % sizeof(Padding);
  if (PaddingSize) {
    File->write((const char *)&Padding, PaddingSize);
  }
  for (auto it = QueueOrder.begin(), ie = QueueOrder.end();
       it != ie; ++it) {
    dumpOne(*it);
  }
}

void DbgInfoMgr::dumpOne(const Stmt *s) {
  File->write((const char*)&(UuidInfo[s]), sizeof(UUID_t));
  if (const Stmt *P = ParentInfo[s]) {
    File->write((const char*)&(UuidInfo[P]), sizeof(UUID_t));
  } else {
    UUID_t EmptyUuid;
    File->write((const char*)&EmptyUuid, sizeof(UUID_t));
  }
  std::size_t FNSize = DbgInfo[s].File.size()+1;
  File->write((const char *)&FNSize, sizeof(FNSize));
  File->write(DbgInfo[s].File.c_str(), FNSize);
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (sizeof(FNSize) + FNSize) % sizeof(Padding);
  if (PaddingSize) {
    File->write((const char*)&Padding, PaddingSize);
  }
  File->write((const char*)&DbgInfo[s].Line, sizeof(DbgInfo[s].Line));
  File->write((const char*)&DbgInfo[s].Col, sizeof(DbgInfo[s].Col));
}
