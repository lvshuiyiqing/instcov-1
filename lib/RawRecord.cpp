//===-- RawRecord.cpp -------- RawRecord classes definition -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for raw records
///
//===----------------------------------------------------------------------===//

#include "instcov/RawRecord.h"

using namespace instcov;

void RawRecord::loadBodyFromFile(std::istream &File) {
}

void RawRecord_DC::loadBodyFromFile(std::istream &File) {
  File.read((char *)&BID, sizeof(BID));
}

void RawRecord_Switch::loadBodyFromFile(std::istream &File) {
  File.read((char *)&BID, sizeof(BID));
}

void RawRecord_Func::loadBodyFromFile(std::istream &File) {
}

void RawRecord::dumpPretty(std::ostream &OS) const {
  OS << "[" << getStrKind() << "] UUID="
     << Uuid.toString();
}

void RawRecord_DC::dumpPretty(std::ostream &OS) const {
  RawRecord::dumpPretty(OS);
  OS << ", BID=" << BID;
}

void RawRecord_Switch::dumpPretty(std::ostream &OS) const {
  RawRecord::dumpPretty(OS);
  OS << ", BID=" << BID;
}

void RawRecord_Func::dumpPretty(std::ostream &OS) const {
  RawRecord::dumpPretty(OS);
}
