//===-- DbgInfoDB.cpp ------ debug info database definition -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for the debug info database
/// for analysis trace file
///
//===----------------------------------------------------------------------===//

#include <fstream>
#include <set>
#include "instcov/DbgInfoDB.h"
#include "llvm/Support/raw_ostream.h"

namespace {
const char INSTCOV_MAGIC[] = "INSTCOV";
const char INSTCOV_VERSION[] = "1";
}

using namespace llvm;
using namespace instcov;

DbgInfoEntry_View *DbgInfoEntry_View::toRoot(void) {
  DbgInfoEntry_View *Node = this;
  while (Node->P) {
    Node = Node->P;
  }
  return Node;
}

void DbgInfoEntry_View::dump(void) const {
  llvm::outs() << Uuid.toString() << ":"
               << (P?(P->Uuid.toString()):("")) << ":"
               << File << ":"
               << Line << ":"
               << Col << "\n";
}

DbgInfoDB::DbgInfoDB(void) {
}

DbgInfoDB::~DbgInfoDB(void) {
  for (auto it = Entries.begin(), ie = Entries.end(); it != ie; ++it) {
    delete it->second;
  }
}

void DbgInfoDB::loadFile(const std::string &FileName) {
  std::ifstream InFile(FileName.c_str());
  if (!InFile) {
    llvm::errs() << "cannot open file: " << FileName << "\n";
    exit(1);
  }
  
  // read magic
  char Magic[sizeof(INSTCOV_MAGIC)-1];
  char Version[sizeof(INSTCOV_VERSION)-1];
  InFile.read(Magic, sizeof(INSTCOV_MAGIC)-1);
  if (InFile.fail() || memcmp(INSTCOV_MAGIC, Magic, sizeof(INSTCOV_MAGIC)-1)) {
    llvm::errs() << "cannot recognize the magic bits in the input stream: "
                 << FileName << "\n";
    exit(1);
  }
  InFile.read(Version, sizeof(INSTCOV_VERSION)-1);
  uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding)
      - (sizeof(INSTCOV_MAGIC)-1 + sizeof(INSTCOV_VERSION)-1)
      % sizeof(Padding);
  if (PaddingSize) {
    InFile.read((char *)&Padding, PaddingSize);
  }
  if (InFile.fail() ||
      memcmp(INSTCOV_VERSION, Version, sizeof (INSTCOV_VERSION)-1)) {
    llvm::errs() << "cannot recognize the version bits in the input stream: "
                 << FileName << "\n";
    exit(1);
  }

  // read file content
  while (!(InFile.peek(), InFile.eof())) {
    DbgInfoEntry_View NewEntry;
    UUID_t P_Uuid;
    std::string File;
    InFile.read((char *)&(NewEntry.Uuid), sizeof(UUID_t));
    InFile.read((char *)&P_Uuid, sizeof(UUID_t));
    std::size_t FNSize = 0;
    InFile.read((char *)&FNSize, sizeof(FNSize));
    char *FNBuf = new char[FNSize];
    InFile.read(FNBuf, FNSize);
    NewEntry.File = FNBuf;
    delete[] FNBuf;
    uint64_t Padding = 0;
    std::size_t PaddingSize =
        sizeof(Padding) - (sizeof(FNSize) + FNSize) % sizeof(Padding);
    if (PaddingSize) {
      InFile.read((char *)&Padding, PaddingSize);
    }
    InFile.read((char *)&(NewEntry.Line), sizeof(NewEntry.Line));
    InFile.read((char *)&(NewEntry.Col), sizeof(NewEntry.Col));
    if (InFile.bad() || InFile.fail()) {
      llvm::errs() << "incomplete debug info entry: " << FileName << "\n";
      exit(1);
    }
    registerEntry(NewEntry, P_Uuid);
  }
}

void DbgInfoDB::registerEntry(const DbgInfoEntry_View &Entry, UUID_t &P_Uuid) {
  UUID_t ThisUuid = Entry.Uuid;
  if (Entries.count(ThisUuid) == 0) {
    Entries[ThisUuid] = new DbgInfoEntry_View(ThisUuid, Entries.size()+1);
  }
  if (Entries[ThisUuid]->isSet) {
    llvm::errs() << "this entry already appeared once, why another?"
                 << ThisUuid.toString() << "\n";
    exit(1);
  }
  Entries[ThisUuid]->P = Entry.P;
  Entries[ThisUuid]->File = Entry.File;
  Entries[ThisUuid]->Line = Entry.Line;
  Entries[ThisUuid]->Col = Entry.Col;
  Entries[ThisUuid]->isSet = true;
  if (P_Uuid.isValid()) {
    if (Entries.count(P_Uuid) == 0) {
      Entries[P_Uuid] = new DbgInfoEntry_View(P_Uuid, Entries.size()+1);
    }
    Entries[P_Uuid]->Children.push_back(Entries[Entry.Uuid]);
    Entries[ThisUuid]->P = Entries[P_Uuid];
  }
}

bool DbgInfoDB::selfCheck(void) const {
  std::set<DbgInfoEntry_View *> Visited;
  for (auto it = Entries.begin(), ie = Entries.end(); it != ie; ++it) {
    std::set<DbgInfoEntry_View *> ThisVisited;
    DbgInfoEntry_View *Node = it->second;
    if (!(Node->isSet)) {
      llvm::errs() << "The location info for this node is missing" <<
          Node->Uuid.toString() << "\n";
      exit(1);
    }
    if (Visited.count(Node)) {
      continue;
    }
    while (Node) {
      if (ThisVisited.count(Node)) {
        return false;
      }
      if (Visited.count(Node)) {
        break;
      }
      ThisVisited.insert(Node);
      Visited.insert(Node);
      Node = Node->P;
    }
  }
  return true;
}

