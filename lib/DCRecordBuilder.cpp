//===-- DCRecordBuilder.cpp ----- DCRecordBuilder definition ----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition of the tree for debug info
/// slots (to be/already) read from the trace file
///
//===----------------------------------------------------------------------===//

#include <stack>
#include "instcov/DCRecordBuilder.h"
#include "instcov/RawRecord.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

DCRecordBuilder::DCRecordBuilder(UUID_t Root, const DbgInfoMgr &dim)
    : R(Root), DIM(dim) {
  NumEmptySlots = DIM.getNumNodes4DC(R);
}

DCRecordBuilder::~DCRecordBuilder(void) {
}

bool DCRecordBuilder::canAccept(UUID_t Uuid) const {
  return (DIM.toRoot4DC(Uuid) == R) && Records.count(Uuid) == 0;
}

void DCRecordBuilder::fill(UUID_t Uuid, uint64_t bid) {
  if (Records.count(Uuid) == 1) {
    llvm::errs() << "record already filled in the tree, why another?\n";
    exit(1);
  }
  if (DIM.toRoot4DC(Uuid) != R) {
    llvm::errs() << "recorded a node outside the tree, exiting.\n";
    llvm::errs() << "the node is: " << Uuid.toString() << "\n";
    llvm::errs() << "its root node is: " << DIM.toRoot4DC(Uuid).toString()
                 << "\n";
    llvm::errs() << "the root should be: " << R.toString() << "\n";
    exit(1);
  }
  Records[Uuid] = bid;
  --NumEmptySlots;
}

void DCRecordBuilder::getUUIDsDFS(UUID_t Uuid, std::deque<UUID_t> &uuids) const {
  uuids.push_back(Uuid);
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(Uuid);
  for (auto &Child : DI.Children) {
    getUUIDsDFS(Child, uuids);
  }
}

DCRecord DCRecordBuilder::convert2DCRecord(void) const {
  std::deque<UUID_t> Uuids;
  getUUIDsDFS(R, Uuids);
  Uuids.pop_front();
  DCRecord DCR;
  DCR.DecVal = *Records.find(R);
  for (auto &Child : Uuids) {
    if (Records.count(Child)) {
      DCR.Cond2Val.insert(*Records.find(Child));
    } else {
      DCR.Cond2Val[Child] = BID_NA;
    }
  }
  return DCR;
}
