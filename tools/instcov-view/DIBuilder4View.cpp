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
#include <algorithm>
#include "DIBuilder4View.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

namespace {
const char INSTCOV_MAGIC[] = "INSTCOV";
const char INSTCOV_VERSION[] = "1";
}

using namespace llvm;
using namespace instcov;

extern cl::opt<std::string> DumpFormat;

DIBuilder4View::DIBuilder4View() {
}

DIBuilder4View::~DIBuilder4View() {
}

void DIBuilder4View::registerInfo(UUID_t c, UUID_t p, const LocInfo &loc) {
  allocateSID(c);
  allocateSID(p);
  DbgInfoMgr::registerInfo(c, p, loc);
}

void DIBuilder4View::loadFile(const std::string &FileName) {
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
    LocInfo Loc;
    UUID_t Uuid, Uuid_P;
    std::string File;
    InFile.read((char *)&(Uuid), sizeof(UUID_t));
    InFile.read((char *)&Uuid_P, sizeof(UUID_t));
    std::size_t FNSize = 0;
    InFile.read((char *)&FNSize, sizeof(FNSize));
    char *FNBuf = new char[FNSize];
    InFile.read(FNBuf, FNSize);
    Loc.File = FNBuf;
    delete[] FNBuf;
    uint64_t Padding = 0;
    std::size_t PaddingSize =
        sizeof(Padding) - (sizeof(FNSize) + FNSize) % sizeof(Padding);
    if (PaddingSize) {
      InFile.read((char *)&Padding, PaddingSize);
    }
    InFile.read((char *)&(Loc.Line), sizeof(Loc.Line));
    InFile.read((char *)&(Loc.Col), sizeof(Loc.Col));
    if (InFile.bad() || InFile.fail()) {
      llvm::errs() << "incomplete debug info entry: " << FileName << "\n";
      exit(1);
    }
    registerInfo(Uuid, Uuid_P, Loc);
  }
}

namespace {
struct CmpFunc {
  template<typename T>
  bool operator () (const T &left,
                    const T &right) {
    return std::make_tuple(left->Loc.File,
                           left->Loc.Line,
                           left->Loc.Col) <
      std::make_tuple(right->Loc.File,
                      right->Loc.Line,
                      right->Loc.Col);
  }
};
}

void DIBuilder4View::dumpPrettyDFS(std::ostream &OS,
                                   UUID_t Uuid,
                                   std::size_t depth) const {
  const DbgInfo &DI = getDbgInfo(Uuid);
  uint64_t sid = getSID(Uuid);
  for (std::size_t i = 0; i < depth; ++i) {
    OS << "-";
  }
  for (std::size_t i = 0; i < DumpFormat.size(); ++i) {
    switch (DumpFormat[i]) {
      case 'u':
        OS << std::hex << DI.Uuid.high << DI.Uuid.low << std::dec;
        break;
      case 's':
        OS << sid;
        break;
      case 'l':
        OS << DI.Loc.Line;
        break;
      case 'c':
        OS << DI.Loc.Col;
        break;
      case 'f':
        OS << DI.Loc.File;
        break;
      default:
        OS << DumpFormat[i];
        break;
    }
  }
  OS << "\n";
  for (auto &&Child : DI.Children) {
    dumpPrettyDFS(OS, Child, depth+1);
  }
}

void DIBuilder4View::dumpPretty(std::ostream &OS) const {
  std::vector<const DbgInfo *> RootDIs;
  for (auto &&Uuid_DI : getDbgInfos()) {
    if (!(Uuid_DI.second.Uuid_P)) {
      RootDIs.push_back(&(Uuid_DI.second));
    }
  }
  std::sort(RootDIs.begin(), RootDIs.end(), CmpFunc());
  for (auto &&RootDI : RootDIs) {
    dumpPrettyDFS(OS, RootDI->Uuid, 0);
  }
}

UUID_t DIBuilder4View::toRoot(UUID_t Uuid) const {
  if (!Uuid || !isExist(Uuid)) {
    return UUID_t();
  }
  UUID_t CurUuid = Uuid;
  while (getDbgInfo(CurUuid).Uuid_P) {
    CurUuid = getDbgInfo(CurUuid).Uuid_P;
  }
  return CurUuid;
}

void DIBuilder4View::allocateSID(UUID_t Uuid) {
  if (!Uuid) {
    return;
  }
  if (!Uuid2SID.count(Uuid)) {
    Uuid2SID[Uuid] = Uuid2SID.size();
  }
}
