//===-- DISlotTree.cpp ----- debug info slot tree definition ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition of the tree for debug info
/// slots (to be/already) read from the trace file
///
//===----------------------------------------------------------------------===//

#include <stack>
#include "instcov/DISlotTree.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

extern cl::opt<std::string> DumpFormat;

DISlotTree::DISlotTree(UUID_t Root, const DbgInfoMgr &dim)
    : R(Root), DIM(dim) {
  NumEmptySlots = DIM.getNumNodes4DC(R);
}

DISlotTree::~DISlotTree(void) {
}

bool DISlotTree::canAccept(UUID_t Uuid) const {
  return (DIM.toRoot4DC(Uuid) == R) && Records.count(Uuid) == 0;
}

void DISlotTree::fill(UUID_t Uuid, uint64_t bid) {
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

void DISlotTree::dump(std::ostream &OS) const {
  printTreeDFS(OS, R, 0);
}

void DISlotTree::printTreeDFS(std::ostream &OS,
                              UUID_t Uuid,
                              uint64_t depth) const {
  for (uint64_t i = 0; i < depth; ++i) {
    OS << "-";
  }
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(Uuid);
  for (std::size_t i = 0; i < DumpFormat.size(); ++i) {
    switch (DumpFormat[i]) {
      case 'u':
        OS << std::hex << Uuid.high << Uuid.low << std::dec;
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
      case 'b':
        if (Records.count(Uuid)){
          OS << Records.find(Uuid)->second;
        } else {
          OS << "NA";
        }
        break;
      default:
        OS << DumpFormat[i];
        break;
    }
  }
  OS << "\n";
  for (auto &Child : DI.Children) {
    printTreeDFS(OS, Child, depth+1);
  }
}

void DISlotTree::getUUIDsDFS(UUID_t Uuid, std::deque<UUID_t> &uuids) const {
  uuids.push_back(Uuid);
  const DbgInfo_DC &DI = *DIM.getDbgInfoDC(Uuid);
  for (auto &Child : DI.Children) {
    getUUIDsDFS(Child, uuids);
  }
}

LogEntry DISlotTree::convert2LogEntry(void) const {
  std::deque<UUID_t> Uuids;
  getUUIDsDFS(R, Uuids);
  Uuids.pop_front();
  LogEntry LE;
  LE.DecVal = *Records.find(R);
  for (auto &Child : Uuids) {
    if (Records.count(Child)) {
      LE.Cond2Val.insert(*Records.find(Child));
    } else {
      LE.Cond2Val[Child] = BID_NA;
    }
  }
  return LE;
}
