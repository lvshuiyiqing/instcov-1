//===-- DbgInfoDB.cpp ------ debug info database definition -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
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
#include "PrettyDumper.h"
#include "instcov/RawRecord.h"
#include "instcov/DCRecordBuilder.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

PrettyDumper::PrettyDumper(const DbgInfoMgr &dim)
    : DIM(dim) {
  allocateAllSIDs();
}

PrettyDumper::~PrettyDumper(void) {
}

void PrettyDumper::allocateAllSIDs(void) {
  for (const auto &Uuid_DI : DIM.getDbgInfos()) {
    allocateSID(Uuid_DI.first);
  }

}

void PrettyDumper::allocateSID(UUID_t Uuid) {
  if (!Uuid) {
    return;
  }
  if (!Uuid2SID.count(Uuid)) {
    Uuid2SID[Uuid] = Uuid2SID.size();
  }
}

void PrettyDumper::dumpDIPrettyDC(std::ostream &OS) const {
  std::vector<const DbgInfo_DC *> RootDIs;
  for (auto &Uuid : DIM.getRegisteredDCs()) {
    const DbgInfo_DC *DI = DIM.getDbgInfoDC(Uuid);
    if (!(DI->Uuid_P)) {
      RootDIs.push_back(DI);
    }
  }
  std::sort(RootDIs.begin(), RootDIs.end(), CmpDbgInfoLoc());
  for (auto &RootDI : RootDIs) {
    dumpDIPrettyDC_DFS(OS, RootDI->Uuid, 0);
  }
}

void PrettyDumper::dumpDIPretty(std::ostream &OS) const {
  for (auto &Uuid_DI : DIM.getDbgInfos()) {
    Uuid_DI.second->dumpPretty(OS);
    OS << "\n";
  }
}

void PrettyDumper::dumpDIPrettyDC_DFS(std::ostream &OS,
                                      UUID_t Uuid,
                                      std::size_t depth) const {
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(Uuid);
  for (std::size_t i = 0; i < depth; ++i) {
    OS << "-";
  }
  DI.dumpPretty(OS);
  OS << "\n";
  for (auto &Child : DI.Children) {
    dumpDIPrettyDC_DFS(OS, Child, depth+1);
  }
}

void PrettyDumper::dumpTracePrettyDC(std::ostream &OS,
                                     const DCRecordMgr &DCRM) const {
  for (auto &DCRB : DCRM.getRecordBuilders()) {
    dumpDCRecordPretty(OS, DCRB->convert2DCRecord());
  }
}

void PrettyDumper::dumpTracePretty(std::ostream &OS,
                                   const RawRecordMgr &RRM) const {
  for (auto &RR : RRM.getRecords()) {
    RR->dumpPretty(OS);
    OS << "\n";
  }
}

void PrettyDumper::dumpDCRecordPretty(std::ostream &OS,
                                      const DCRecord &DCR) const {
  dumpDCRecordItemPretty(OS, 0, DCR.DecVal);
  auto SortedCondVals = getSortedIterators(DCR.Cond2Val, DIM);
  for (auto &it_Cond_Val : SortedCondVals) {
    dumpDCRecordItemPretty(OS, 1, *it_Cond_Val);
  }
}

void PrettyDumper::dumpDCRecordItemPretty(
    std::ostream &OS,
    std::size_t depth,
    const std::pair<UUID_t, uint64_t> &DC) const {
  for (uint64_t i = 0; i < depth; ++i) {
    OS << "-";
  }
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(DC.first);
  if (DC.second != BID_NA){
    OS << "BID=" << DC.second << " ";
  } else {
    OS << "BID=NA ";
  }
  DI.dumpPretty(OS);
  OS << "\n";
}
