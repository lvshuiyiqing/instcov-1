//===-- DCRecordMgr.cpp --- DC trace record manager definition --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition for DC trace record manager
///
//===----------------------------------------------------------------------===//

#include <cstdlib>
#include <fstream>
#include <stack>
#include "llvm/Support/raw_ostream.h"
#include "instcov/DCRecordMgr.h"

using namespace instcov;
using namespace llvm;

namespace {
const char INSTCOV_DUMP_MAGIC[] = "INSTCOV_DUMP";
const char INSTCOV_DUMP_VERSION[] = "1";

void readOneRecord(std::istream &File, UUID_t &Uuid, uint64_t &bid) {
  File.read(reinterpret_cast<char *>(&Uuid), sizeof(Uuid));
  File.read(reinterpret_cast<char *>(&bid), sizeof(bid));
  if (File.bad()) {
    llvm::errs() << "failed to read a record\n";
    exit(1);
  }
}
}

void RecordMgr::processTrace(const std::string &FileName) {
  std::ifstream InFile(FileName.c_str(), std::ios::binary);
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

  uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding)
      - (sizeof(INSTCOV_DUMP_MAGIC) - 1 + sizeof(INSTCOV_DUMP_VERSION) -1)
      % sizeof(Padding);
  if (PaddingSize) {
    InFile.read((char *)&Padding, PaddingSize);
  }
  std::stack<std::shared_ptr<DISlotTree> > TreeStack;
  // read records
  while ((InFile.peek(), InFile && !InFile.eof())) {
    UUID_t Uuid;
    uint64_t bid;
    readOneRecord(InFile, Uuid, bid);
    if (DIM.isDC(Uuid) == 0) {
      llvm::errs() << "cannot find UUID in debug info database!!\n"
                   << "did you run the program again after recompiling?\n";
      exit(1);
    }
    // llvm::errs() << "got UUID: " << Node->Uuid.toString() << "==>"
    //              << Node->toRoot()->Uuid.toString() << "\n";
    if (TreeStack.empty() || !TreeStack.top()->canAccept(Uuid)) {
      // llvm::errs() << "creating a new tree\n";
      TreeStack.push(std::shared_ptr<DISlotTree>(
          new DISlotTree(getDIM().toRoot4DC(Uuid), getDIM())));
    }
    // llvm::errs() << "current root:"  << TreeStack.top()->R->Uuid.toString() << "\n";
    TreeStack.top()->fill(Uuid, bid);
    if (TreeStack.top()->isRootFilled()) {
      RecordTrees.push_back(TreeStack.top());
      TreeStack.pop();
    }
  }
}

void RecordMgr::dump(std::ostream &OS) const {
  for (auto &RecordTree : RecordTrees) {
    RecordTree->dump(OS);
  }
}
