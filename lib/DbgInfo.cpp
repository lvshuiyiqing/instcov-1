//===-- DbgInfo.cpp ----------- debug info definitions ----------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for the debug info
///
//===----------------------------------------------------------------------===//

#include "instcov/DbgInfo.h"
#include "instcov/uuid.h"

using namespace llvm;
using namespace instcov;

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
  std::size_t FuncNameSize;
  File.read((char *)&FuncNameSize, sizeof(FuncNameSize));
  char *buffer = new char[FuncNameSize];
  File.read(buffer, FuncNameSize);
  FuncName.assign(buffer, buffer+FuncNameSize-1);
  delete buffer;
  const uint64_t Padding = 0;
  std::size_t PaddingSize =
      sizeof(Padding) - (4 + sizeof(FuncNameSize) + FuncNameSize) % sizeof(Padding);
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

void DbgInfo_Switch::dump2File(std::ostream &OS) const {
  DbgInfo::dump2File(OS);
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

void DbgInfo::dumpPretty(std::ostream &OS) const {
  OS << "[" << getMagic() << "]"
     << "Loc=" << Loc.toString() << ", UUID="
     << Uuid.toString();
}

void DbgInfo_DC::dumpPretty(std::ostream &OS) const {
  DbgInfo::dumpPretty(OS);
  OS << ", Parent=" << Uuid_P.toString();
}

void DbgInfo_Switch::dumpPretty(std::ostream &OS) const {
  DbgInfo::dumpPretty(OS);
}

void DbgInfo_Func::dumpPretty(std::ostream &OS) const {
  DbgInfo::dumpPretty(OS);
  OS << ", Name=" << FuncName;
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
  if (DbgInfo::Builder::getBuilder().has(type)) {
    DI = DbgInfo::Builder::getBuilder().createDbgInfo(type);
  } else {
    std::cerr << "unrecognized debug info type: " << type << std::endl;
    exit(1);
  }
  DI->loadBodyFromFile(File);
  return DI;
}

REGISTER_DBGINFO_CREATOR(DbgInfo_DC)
REGISTER_DBGINFO_CREATOR(DbgInfo_Switch)
REGISTER_DBGINFO_CREATOR(DbgInfo_Func)
