//===-- ProblemGenerator.cpp ---- ProblemGenerator definition ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the definitions for ProblemGenerator
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include "ProblemGenerator.h"

using namespace llvm;
using namespace instcov;

ProblemGenerator::ProblemGenerator(void) {
}

ProblemGenerator::~ProblemGenerator(void) {
}

void ProblemGenerator::registerLogEntry(const LogEntry *E) {
}

std::size_t ProblemGenerator::encodeDC(
    std::size_t sid,
    std::size_t fid, std::size_t rid,
    char type) {
  std::stringstream ss;
  ss << type << "_" << fid << "_"
     << rid << "_" << sid;
  return encodeStr(ss.str());
}

std::size_t ProblemGenerator::encodeTV(
    std::size_t id, char type) {
  std::stringstream ss;
  ss << type << "_" << id;
  return encodeStr(ss.str());
}

std::size_t ProblemGenerator::encodeStr(const std::string &str) {
  if (IDPool.count(str)) {
    return IDPool[str];
  }
  IDPool[str] = IDPool.size()+1;
  ID2Str[IDPool.size()] = str;
  return 0;
}
