//===-- DCAnalyzer.cpp --- DC coverage analyzer definitions -----*- C++ -*-===//
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
#include "llvm/Support/CommandLine.h"
#include "DCAnalyzer.h"

using namespace llvm;
using namespace instcov;

cl::opt<bool> WithConditions(
    "with-conditions",
    cl::desc("analyze conditions for DC analyzer"),
    cl::init(true));

void DCAnalyzer::registerRawRecord(const RawRecord *RR) {
  if (!isa<RawRecord_DC>(RR)) {
    return;
  }
  const RawRecord_DC *RRDC = cast<RawRecord_DC>(RR);
  if (!CoveredDCs.count(RRDC->Uuid)) {
    CoveredDCs[RRDC->Uuid] = std::make_pair<bool, bool>(false, false);
  }
  if (RRDC->BID) {
    // true side
    CoveredDCs[RRDC->Uuid].first = true;
  } else {
    CoveredDCs[RRDC->Uuid].second = true;
  }
}

void DCAnalyzer::dump(std::ostream &OS) const {
  std::vector<const DbgInfo_DC *> RootDIs;
  for (auto &Uuid : DIM.getRegisteredDCs()) {
    const DbgInfo_DC *DI = DIM.getDbgInfoDC(Uuid);
    if (!(DI->Uuid_P)) {
      RootDIs.push_back(DI);
    }
  }
  std::sort(RootDIs.begin(), RootDIs.end(), CmpDbgInfoLoc());
  for (auto &RootDI : RootDIs) {
    dumpDFS(OS, RootDI->Uuid, 0);
  }
}

void DCAnalyzer::dumpDFS(std::ostream &OS,
                         UUID_t Uuid,
                         std::size_t depth) const {
  if (!WithConditions && depth != 0) {
    return;
  }
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(Uuid);
  for (std::size_t i = 0; i < depth; ++i) {
    OS << "-";
  }
  OS << "[";
  if (!CoveredDCs.count(Uuid)) {
    OS << "--";
  } else {
    std::pair<bool, bool> DCCov = CoveredDCs.find(Uuid)->second;
    OS << ((DCCov.first) ? "+" : "-");
    OS << ((DCCov.second) ? "+" : "-");
  }
  OS << "]";
  DI.dumpPretty(OS);
  OS << "\n";
  for (auto &Child : DI.Children) {
    dumpDFS(OS, Child, depth+1);
  }
}
