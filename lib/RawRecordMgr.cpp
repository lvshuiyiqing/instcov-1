//===-- RawRecordMgr.h -- raw trace record manager definition ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitionsfor raw trace record manager
///
//===----------------------------------------------------------------------===//

#include <fstream>
#include "llvm/Support/raw_ostream.h"
#include "instcov/RawRecordMgr.h"

using namespace instcov;

namespace {
const char INSTCOV_DUMP_MAGIC[] = "INSTCOV_DUMP";
const char INSTCOV_DUMP_VERSION[] = "1";
}

void RawRecordMgr::loadFromFile(const std::string &FileName) {
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
  InFile.seekg(PaddingSize, std::ios::cur);

  // read records
  while ((InFile.peek(), !InFile.eof())) {
    UUID_t Uuid;
    InFile.read((char *)&Uuid, sizeof(Uuid));
    if (!DIM.isExist(Uuid)) {
      llvm::errs() << "UUID=" << Uuid.toString()
                   << " not found in the debug info database\n";
      exit(1);
    }
    const DbgInfo *DI = DIM.getDbgInfo(Uuid);
    RecordItem *RI = DI->createRecordItem();
    RI->loadBodyFromFile(InFile);
    RecordItems.push_back(RI);
  }
}
