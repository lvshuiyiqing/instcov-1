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
#include "instcov/RecordItem.h"
#include "instcov/uuid.h"
#include <iostream>
#include <stack>

using namespace llvm;
using namespace instcov;

namespace {
const char INSTCOV_MAGIC[] = "INSTCOV";
const char INSTCOV_VERSION[] = "1";
}

void DbgInfo::dump2File(std::ostream &OS) const {
  OS.write(getMagic(), 4);
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

void DbgInfo::loadBodyFromFile(std::istream &File) {
  std::size_t FNSize;
  File.read((char *)&FNSize, sizeof(FNSize));
  char *buffer = new char[FNSize];
  File.read(buffer, FNSize);
  Loc.File.assign(buffer, buffer+FNSize-1);
  delete buffer;
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (4 + sizeof(FNSize) + FNSize) % sizeof(Padding);
  if (PaddingSize) {
    File.seekg(PaddingSize, std::ios::cur);
  }
  File.read((char *)&Loc.Line, sizeof(Loc.Line));
  File.read((char *)&Loc.Col, sizeof(Loc.Col));
  File.read((char *)&Uuid, sizeof(Uuid));
}

void DbgInfo_DC::loadBodyFromFile(std::istream &File) {
  DbgInfo::loadBodyFromFile(File);
  File.read((char *)&Uuid_P, sizeof(Uuid_P));
}

void DbgInfo_Func::loadBodyFromFile(std::istream &File) {
  DbgInfo::loadBodyFromFile(File);
  std::size_t FileNameSize;
  File.read((char *)&FileNameSize, sizeof(FileNameSize));
  char *buffer = new char[FileNameSize];
  File.read(buffer, FileNameSize);
  Loc.File.assign(buffer, buffer+FileNameSize-1);
  delete buffer;
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (4 + sizeof(FileNameSize) + FileNameSize) % sizeof(Padding);
  if (PaddingSize) {
    File.seekg(PaddingSize, std::ios::cur);
  }
}

void DbgInfo_Switch::loadBodyFromFile(std::istream &File) {
  DbgInfo::loadBodyFromFile(File);
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
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (4 + sizeof(FuncNameSize) + FuncNameSize) % sizeof(Padding);
  if (PaddingSize) {
    OS.write((const char *)&Padding, PaddingSize);
  }
}

void DbgInfo_Switch::dump2File(std::ostream &OS) const {
  DbgInfo::dump2File(OS);
}

std::string LocInfo::toString(void) const {
  std::stringstream ss;
  ss << Line << ":" << Col << ":" << File;
  return ss.str();
}

DbgInfo *DbgInfo::loadFromFile(std::istream &File) {
  char type_buff[5] = {0};
  File.read(type_buff, 4);
  std::string type = type_buff;
  DbgInfo *DI = 0;
  if (type == "DCDC") {
    DI = new DbgInfo_DC();
  } else if (type == "SWTH") {
    DI = new DbgInfo_Switch();
  } else if (type == "FUNC") {
    DI = new DbgInfo_Func();
  } else {
    std::cerr << "unrecognized debug info type" << std::endl;
    exit(1);
  }
  DI->loadBodyFromFile(File);
  return DI;
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
    if (!isExist(p)) {
      std::cerr << "you need to register the parent DC first" << std::endl;
      exit(1);
    }
    if (DbgInfos[p]->getKind() != DbgInfo::DIK_DC) {
      std::cerr << "the parent is not DC, why?" << std::endl;
      exit(1);
    }
    theDbgInfoDC(p)->Children.push_back(c);
  }
}

void DbgInfoMgr::registerFuncInfo(
    UUID_t uuid, const std::string &funcName, const LocInfo &loc) {
  if (isExist(uuid)) {
    std::cerr << "this UUID is already registered, why another?" << std::endl;
    exit(1);
  }
  DbgInfos[uuid] = new DbgInfo_Func(loc, uuid, funcName);
  QueueOrder.push_back(uuid);
  RegisteredUuids.insert(uuid);
}

void DbgInfoMgr::registerSwitchInfo(
    UUID_t uuid, const LocInfo &loc) {
  if (isExist(uuid)) {
    std::cerr << "this UUID is already registered, why another?" << std::endl;
    exit(1);
  }
  DbgInfos[uuid] = new DbgInfo_Switch(loc, uuid);
  QueueOrder.push_back(uuid);
  RegisteredUuids.insert(uuid);
}

void DbgInfoMgr::dump(std::ostream &File) const {
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

void DbgInfoMgr::load(std::istream &File) {
  while (!File.eof()) {
    loadOne(File);
  }
}

void DbgInfoMgr::loadOne(std::istream &File) {
  DbgInfo *DI = DbgInfo::loadFromFile(File);
  if (isa<DbgInfo_DC>(DI)) {
    RegisteredDCs.insert(DI->Uuid);
  }
  RegisteredUuids.insert(DI->Uuid);
  DbgInfos.insert(std::make_pair(DI->Uuid, DI));
  QueueOrder.push_back(DI->Uuid);
}

bool DbgInfoMgr::selfCheck4DC(void) const {
  for (auto uuid : RegisteredDCs) {
    auto di = getDbgInfoDC(uuid);
    UUID_t Uuid_P = di->Uuid_P;
    if (Uuid_P && RegisteredDCs.count(Uuid_P) == 0) {
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

UUID_t DbgInfoMgr::toRoot4DC(UUID_t Uuid) const {
  if (!Uuid || !isExist(Uuid)) {
    return UUID_t();
  }
  UUID_t CurUuid = Uuid;
  while (getDbgInfoDC(CurUuid)->Uuid_P) {
    CurUuid = getDbgInfoDC(CurUuid)->Uuid_P;
  }
  return CurUuid;
}

RecordItem *DbgInfo_DC::createRecordItem(void) const {
  return new RecordItem_DC(Uuid);
}

RecordItem *DbgInfo_Switch::createRecordItem(void) const {
  return new RecordItem_Switch(Uuid);
}

RecordItem *DbgInfo_Func::createRecordItem(void) const {
  return new RecordItem_Func(Uuid);
}
