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

#include "instcov/DbgInfoMgr.h"
#include "instcov/uuid.h"
#include <iostream>
#include <fstream>
#include <stack>

using namespace instcov;

namespace {
const char INSTCOV_MAGIC[] = "INSTCOV";
const char INSTCOV_VERSION[] = "1";
}

void DbgInfo::dump2File(std::ostream &OS) const {
  switch (Kind) {
    case DIK_DC:
      OS.write("DCDC", 4);
      break;
    case DIK_FUNC:
      OS.write("FUNC", 4);
      break;
  }
  std::size_t FNSize = Loc.File.size()+1;
  OS.write((const char *)&FNSize, sizeof(FNSize));
  OS.write(Loc.File.c_str(), FNSize);
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (4 + sizeof(FNSize) + FNSize) % sizeof(Padding);
  if (PaddingSize) {
    OS.write((const char*)&Padding, PaddingSize);
  }
  OS.write((const char*)&Loc.Line, sizeof(Loc.Line));
  OS.write((const char*)&Loc.Col, sizeof(Loc.Col));
  OS.write((const char*)&Uuid, sizeof(Uuid));
}

void DbgInfo_DC::dump2File(std::ostream &OS) const {
  DbgInfo::dump2File(OS);
  OS.write((const char*)&Uuid_P, sizeof(Uuid_P));
}

void DbgInfo_Func::dump2File(std::ostream &OS) const {
  DbgInfo::dump2File(OS);
  std::size_t FuncNameSize = FuncName.size() + 1;
  OS.write((const char*)&FuncNameSize, sizeof(FuncNameSize));
  OS.write(FuncName.c_str(), FuncNameSize);
}

std::string LocInfo::toString(void) const {
  std::stringstream ss;
  ss << Line << ":" << Col << ":" << File;
  return ss.str();
}

DbgInfoMgr::DbgInfoMgr(void) {
}

DbgInfoMgr::~DbgInfoMgr(void) {
  for (auto &DI : DbgInfos) {
    delete DI.second;
  }
}

void DbgInfoMgr::registerDCInfo(
    UUID_t c, UUID_t p, const LocInfo &loc) {
  if (isExist(c)) {
    std::cerr << "this UUID is already registered, why another?" << std::endl;
    exit(1);
  }
  DbgInfos[c] = new DbgInfo_DC(loc, c, p);
  QueueOrder.push_back(c);
  RegisteredUuids.insert(c);
  RegisteredDCs.insert(c);
  if (p) {
    if (DbgInfos[p]->getKind() != DbgInfo::DIK_DC) {
      std::cerr << "the parent is not DC, why?" << std::endl;
      exit(1);
    }
    theDbgInfoDC(p)->Children.push_back(c);
  }
}

void DbgInfoMgr::dump(const std::string &MainFileName) const {
  std::string DbgFileName = MainFileName + ".dbginfo";
  std::ofstream File(DbgFileName, std::ios::binary);
  if (!File) {
    std::cerr << "cannot open debug info file, exiting" << std::endl;
    exit(1);
  }

  File.write(INSTCOV_MAGIC, sizeof(INSTCOV_MAGIC)-1);
  File.write(INSTCOV_VERSION, sizeof(INSTCOV_VERSION)-1);
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding)
      - (sizeof(INSTCOV_MAGIC)-1 + sizeof(INSTCOV_VERSION)-1)
      % sizeof(Padding);
  if (PaddingSize) {
    File.write((const char *)&Padding, PaddingSize);
  }
  for (auto &&QueueItem : QueueOrder) {
    dumpOne(File, QueueItem);
  }
}

void DbgInfoMgr::dumpOne(std::ostream &File, UUID_t Uuid) const {
  if (isExist(Uuid) == 0) {
    std::cerr << "found unregistered UUID in dumping" << std::endl;
    exit(1);
  }
  const DbgInfo *DI = getDbgInfo(Uuid);
  DI->dump2File(File);
}

bool DbgInfoMgr::selfCheck4DC(void) const {
  for (auto uuid : RegisteredDCs) {
    auto di = getDbgInfoDC(uuid);
    UUID_t Uuid_P = di->Uuid_P;
    if (RegisteredDCs.count(Uuid_P) == 0) {
      std::cerr << "DbgInfoMgr self-check: UUID " << Uuid_P.toString()
                << " is a parent, but not registered" << std::endl;
      return false;
    }
  }
  std::set<UUID_t> Visited;
  for (auto &Uuid : RegisteredDCs) {
    std::set<UUID_t> CurVisited;
    UUID_t CurUuid = Uuid;
    while (CurUuid) {
      if (CurVisited.count(CurUuid)) {
        // cycle
        std::cerr << "DbgInfoMgr self-check: there is a cycle at "
                  << CurUuid.toString() << std::endl;
        return false;
      }
      if (Visited.count(CurUuid)) {
        // old node
        break;
      }
      CurVisited.insert(CurUuid);
      Visited.insert(CurUuid);
      CurUuid = getDbgInfoDC(CurUuid)->Uuid_P;
    }
  }
  return true;
}

std::size_t DbgInfoMgr::getNumNodes4DC(UUID_t Uuid) const {
  std::stack<std::pair<const DbgInfo_DC *, std::size_t> > S;
  std::size_t NumNodes = 1;
  S.push(std::make_pair(getDbgInfoDC(Uuid), 0));
  while (!S.empty()) {
    const DbgInfo_DC *p_DI = S.top().first;
    std::size_t CID = S.top().second;
    if (CID >= p_DI->Children.size()) {
      S.pop();
      continue;
    }
    ++NumNodes;
    ++(S.top().second);
    S.push(std::make_pair(getDbgInfoDC(p_DI->Children[CID]), 0));
  }
  return NumNodes;
}
