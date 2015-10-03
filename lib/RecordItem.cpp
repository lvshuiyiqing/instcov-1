//===-- RecordItem.cpp ------- RecordItem classes definition ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for record items
///
//===----------------------------------------------------------------------===//

#include "instcov/RecordItem.h"

using namespace instcov;

void RecordItem::loadBodyFromFile(std::istream &File) {
}

void RecordItem_DC::loadBodyFromFile(std::istream &File) {
  File.read((char *)&BID, sizeof(BID));
}

void RecordItem_Switch::loadBodyFromFile(std::istream &File) {
  File.read((char *)&BID, sizeof(BID));
}

void RecordItem_Func::loadBodyFromFile(std::istream &File) {
}

void RecordItem::dumpPretty(std::ostream &OS) const {
  OS << "[" << getStrKind() << "] UUID="
     << Uuid.toString();
}

void RecordItem_DC::dumpPretty(std::ostream &OS) const {
  RecordItem::dumpPretty(OS);
  OS << ", BID=" << BID;
}

void RecordItem_Switch::dumpPretty(std::ostream &OS) const {
  RecordItem::dumpPretty(OS);
  OS << ", BID=" << BID;
}

void RecordItem_Func::dumpPretty(std::ostream &OS) const {
  RecordItem::dumpPretty(OS);
}
