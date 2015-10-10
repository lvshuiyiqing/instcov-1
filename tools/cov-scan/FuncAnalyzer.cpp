//===-- FuncAnalyzer.cpp --- Function coverage analyzer defs ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition of function coverage analyzer
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/Casting.h"
#include "FuncAnalyzer.h"

using namespace llvm;
using namespace instcov;

void FuncAnalyzer::registerRawRecord(const RawRecord *RR) {
  if (!isa<RawRecord_Func>(RR)) {
    return;
  }
  CoveredFuncUuids.insert(RR->Uuid);
}

void FuncAnalyzer::dump(std::ostream &OS) const {
  auto SortedUuidDbgInfos = getSortedIterators(DIM.getDbgInfos(), DIM);
  for (auto &it_Uuid_DbgInfo : SortedUuidDbgInfos) {
    const DbgInfo *DI = it_Uuid_DbgInfo->second;
    if (!isa<DbgInfo_Func>(DI)) {
      continue;
    }
    UUID_t Uuid = it_Uuid_DbgInfo->first;
    if (CoveredFuncUuids.count(Uuid)) {
      OS << "[+]";
    } else {
      OS << "[-]";
    }
    DI->dumpPretty(OS);
    OS << std::endl;
  }
}
