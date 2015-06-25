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
#include "DISlotTree.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

extern cl::opt<std::string> DumpFormat;

DISlotTree::DISlotTree(UUID_t Root, const DIBuilder4View &dib)
    : R(Root), DIB(dib) {
  NumEmptySlots = DIB.getNumNodes(R);
}

DISlotTree::~DISlotTree(void) {
}

bool DISlotTree::canAccept(UUID_t Uuid) const {
  return (DIB.toRoot(Uuid) == R) && Records.count(Uuid) == 0;
}

void DISlotTree::fill(UUID_t Uuid, uint64_t bid) {
  if (Records.count(Uuid) == 1) {
    llvm::errs() << "record already filled in the tree, why another?\n";
    exit(1);
  }
  if (DIB.toRoot(Uuid) != R) {
    llvm::errs() << "recorded a node outside the tree, exiting.\n";
    llvm::errs() << "the node is: " << Uuid.toString() << "\n";
    llvm::errs() << "its root node is: " << DIB.toRoot(Uuid).toString()
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
  const DbgInfo &DI = DIB.getDbgInfo(Uuid); 
  for (std::size_t i = 0; i < DumpFormat.size(); ++i) {
    switch (DumpFormat[i]) {
      case 'u':
        OS << std::hex << Uuid.high << Uuid.low << std::dec;
        break;
      case 's':
        OS << DIB.getSID(Uuid);
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
  for (auto Child : DI.Children) {
    printTreeDFS(OS, Child, depth+1);
  }
}
