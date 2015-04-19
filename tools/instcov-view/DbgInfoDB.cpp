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

DbgInfoDB::DbgInfoDB(void) {
}

DbgInfoDB::~DbgInfoDB(void) {
  for (auto it = Entries.begin(), ie = Entries.end(); it != ie; ++it) {
    delete it->second;
  }
}

void DbgInfoDB::loadFile(std::istream &InFile) {
  // read magic
  char Magic[sizeof(INSTCOV_MAGIC)-1];
  char Version[sizeof(INSTCOV_VERSION)-1];
  if (!InFile) {
    llvm::errs() << "bad input stream\n";
    exit(1);
  }
  InFile.read(Magic, sizeof(INSTCOV_MAGIC)-1);
  if (InFile.fail() || memcmp(INSTCOV_MAGIC, Magic, sizeof(INSTCOV_MAGIC)-1)) {
    llvm::errs() << "cannot recognize the magic bits in the input stream\n";
    exit(1);
  }
  InFile.read(Version, sizeof(INSTCOV_VERSION)-1);
  if (InFile.fail() ||
      memcmp(INSTCOV_VERSION, Version, sizeof (INSTCOV_VERSION)-1)) {
    llvm::errs() << "cannot recognize the version bits in the input stream\n";
    exit(1);
  }

  // read file content
  while (InFile) {
    DbgInfoEntry_View NewEntry;
    UUID P_Uuid;
    std::string File;
    InFile.read(reinterpret_cast<char *>(&(NewEntry.Uuid)), sizeof(UUID));
    InFile.read(reinterpret_cast<char *>(&P_Uuid), sizeof(UUID));
    InFile >> File;
    NewEntry.File = File;
    InFile.read(reinterpret_cast<char *>(&(NewEntry.Line)),
                sizeof(NewEntry.Line));
    InFile.read(reinterpret_cast<char *>(&(NewEntry.Col)),
                sizeof(NewEntry.Col));
    if (InFile.bad() || InFile.fail()) {
      llvm::errs() << "incomplete debug info entry\n";
      exit(1);
    }
    registerEntry(NewEntry, P_Uuid);
  }
}

void DbgInfoDB::registerEntry(const DbgInfoEntry_View &Entry, UUID &P_Uuid) {
  UUID ThisUuid = Entry.Uuid;
  if (Entries.count(ThisUuid) == 0) {
    Entries.insert(std::make_pair(ThisUuid, new DbgInfoEntry_View(Entry)));
  }
  if (P_Uuid.isValid()) {
    if (Entries.count(P_Uuid) == 0) {
      Entries[P_Uuid]->Uuid = P_Uuid;
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

