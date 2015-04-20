//===-- RecordMgr.cpp ----- trace record manager definition -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition for trace record manager
///
//===----------------------------------------------------------------------===//

#include <cstdlib>
#include <fstream>
#include "llvm/Support/raw_ostream.h"
#include "instcov/RecordMgr.h"

using namespace instcov;
using namespace llvm;

namespace {
const char INSTCOV_DUMP_MAGIC[] = "INSTCOV_DUMP";
const char INSTCOV_DUMP_VERSION[] = "1";

void readOneRecord(std::istream &File, UUID &Uuid, uint64_t &bid) {
  File.read(reinterpret_cast<char *>(&Uuid), sizeof(Uuid));
  File.read(reinterpret_cast<char *>(&bid), sizeof(bid));
  if (File.bad()) {
    llvm::errs() << "failed to read a record\n";
    exit(1);
  }
}
}

void RecordMgr::processTrace(const std::string &FileName) {
  std::ifstream InFile(FileName.c_str());
  if (!InFile) {
    llvm::errs() << "cannot open file: " << FileName << "\n";
    exit(1);
  }
  // check the magic & version
  char Magic[sizeof(INSTCOV_DUMP_MAGIC)-1];
  char Version[sizeof(INSTCOV_DUMP_VERSION)-1];
  InFile.read(Magic, sizeof(Magic));
  if (InFile.bad() || memcmp(INSTCOV_DUMP_MAGIC, Magic, sizeof(Magic))) {
    llvm::errs() << "cannot recognize magic: " << FileName << "\n";
    exit(1);
  }
  InFile.read(Version, sizeof(Version));
  if (InFile.bad() || memcmp(INSTCOV_DUMP_VERSION, Version, sizeof(Version))) {
    llvm::errs() << "cannot recognize version: " << FileName << "\n";
    exit(1);
  }
  std::shared_ptr<DISlotTree> Tree;
  // read records
  while ((InFile.peek(), !InFile.eof())) {
    UUID Uuid;
    uint64_t bid;
    readOneRecord(InFile, Uuid, bid);
    if (DIDB.Entries.count(Uuid) == 0) {
      llvm::errs() << "cannot find UUID in debug info database!!\n"
                   << "did you run the program again after recompiling?\n";
      exit(1);
    }
    DbgInfoEntry_View *Node = DIDB.Entries[Uuid];
    if (!Tree) {
      Tree.reset(new DISlotTree(Node->toRoot()));
    }
    Tree->fill(Node, bid);
    if (Tree->isFull()) {
      RecordTrees.push_back(Tree);
      Tree.reset();
    }
  }
}

void RecordMgr::dump(std::ostream &OS) const {
  for (auto it = RecordTrees.begin(), ie = RecordTrees.end();
       it != ie; ++it) {
    (*it)->dump(OS);
  }
}
