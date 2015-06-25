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

std::string LocInfo::toString(void) const {
  std::stringstream ss;
  ss << Line << ":" << Col << ":" << File;
  return ss.str();
}

DbgInfoMgr::DbgInfoMgr(void) {
}

DbgInfoMgr::~DbgInfoMgr(void) {
}

void DbgInfoMgr::registerInfo(
    UUID_t c, UUID_t p, const LocInfo &loc) {
  if (isExist(c)) {
    std::cerr << "this UUID is already registered, why another?" << std::endl;
    exit(1);
  }
  DbgInfos[c].Loc = loc;
  DbgInfos[c].Uuid = c;
  DbgInfos[c].Uuid_P = p;
  QueueOrder.push_back(c);
  RegisteredUuids.insert(c);
  if (p){
    DbgInfos[p].Children.push_back(c);
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
  for (auto QueueItem : QueueOrder) {
    dumpOne(File, QueueItem);
  }
}

void DbgInfoMgr::dumpOne(std::ostream &File, UUID_t Uuid) const {
  if (isExist(Uuid) == 0) {
    std::cerr << "found unregistered UUID in dumping" << std::endl;
    exit(1);
  }
  const DbgInfo &DI = DbgInfos.find(Uuid)->second;
  File.write((const char*)&(DI.Uuid), sizeof(UUID_t));
  File.write((const char*)&(DI.Uuid_P), sizeof(UUID_t));
  std::size_t FNSize = DI.Loc.File.size()+1;
  File.write((const char *)&FNSize, sizeof(FNSize));
  File.write(DI.Loc.File.c_str(), FNSize);
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (sizeof(FNSize) + FNSize) % sizeof(Padding);
  if (PaddingSize) {
    File.write((const char*)&Padding, PaddingSize);
  }
  File.write((const char*)&DI.Loc.Line, sizeof(DI.Loc.Line));
  File.write((const char*)&DI.Loc.Col, sizeof(DI.Loc.Col));
}

bool DbgInfoMgr::selfCheck(void) const {
  auto it1 = RegisteredUuids.begin(), ie1 = RegisteredUuids.end();
  auto it2 = DbgInfos.begin(), ie2 = DbgInfos.end();
  while (it1 != ie1 && it2 != ie2) {
    if (*it1 != it2->first) {
      std::cerr << "DbgInfoMgr self-check: UUID " << it2->first.toString()
                << " is a parent, but not registered" << std::endl;
      break;
    }
    ++it1; ++it2;
  }
  if (it1 != ie1 || it2 != ie2) {
    // some parent Uuids are not registered
    return false;
  }
  std::set<UUID_t> Visited;
  for (auto Uuid : RegisteredUuids) {
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
      CurUuid = getDbgInfo(CurUuid).Uuid_P;
    }
  }
  return true;
}

std::size_t DbgInfoMgr::getNumNodes(UUID_t Uuid) const {
  std::stack<std::pair<const DbgInfo *, std::size_t> > S;
  std::size_t NumNodes = 1;
  S.push(std::make_pair(&getDbgInfo(Uuid), 0));
  while (!S.empty()) {
    const DbgInfo *p_DI = S.top().first;
    std::size_t CID = S.top().second;
    if (CID >= p_DI->Children.size()) {
      S.pop();
      continue;
    }
    ++NumNodes;
    ++(S.top().second);
    S.push(std::make_pair(&(getDbgInfo(p_DI->Children[CID])), 0));
  }
  return NumNodes;
}
