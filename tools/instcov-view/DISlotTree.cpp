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

namespace {
int64_t findNumNodes(const DbgInfoEntry_View *Root) {
  std::stack<const DbgInfoEntry_View *> S;
  int64_t size = 0;
  S.push(Root);
  while (!S.empty()) {
    ++size;
    const DbgInfoEntry_View *Node = S.top();
    S.pop();
    for (auto it = Node->Children.begin(), ie = Node->Children.end();
         it != ie; ++it) {
      S.push(*it);
    }
  }
  return size;
}
}

DISlotTree::DISlotTree(DbgInfoEntry_View *Root) {
  NumEmptySlots = findNumNodes(Root);
  R = Root;
}

DISlotTree::~DISlotTree(void) {
}

void DISlotTree::fill(DbgInfoEntry_View *Node, uint64_t bid) {
  if (Records.count(Node) == 1) {
    llvm::errs() << "record already filled in the tree, why another?\n";
    exit(1);
  }
  if (Node->toRoot() != R) {
    llvm::errs() << "recorded a node outside the tree, exiting.\n";
    exit(1);
  }
  Records[Node] = bid;
  --NumEmptySlots;
}

void DISlotTree::dump(std::ostream &OS) const {
  printTreeDFS(OS, R, 0);
}

void DISlotTree::printTreeDFS(std::ostream &OS,
                              const DbgInfoEntry_View *Node,
                              uint64_t depth) const {
  for (uint64_t i = 0; i < depth; ++i) {
    OS << "--";
  }
  for (std::size_t i = 0; i < DumpFormat.size(); ++i) {
    switch (DumpFormat[i]) {
      case 'u':
        OS << std::hex << Node->Uuid.high << Node->Uuid.low << std::dec;
        break;
      case 's':
        OS << Node->Sid;
        break;
      case 'l':
        OS << Node->Line;
        break;
      case 'c':
        OS << Node->Col;
        break;
      case 'f':
        OS << Node->File;
        break;
      case 'b':
        if (Records.count(Node)){
          OS << Records.find(Node)->second;
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
  for (auto it = Node->Children.begin(), ie = Node->Children.end();
       it != ie; ++it) {
    printTreeDFS(OS, *it, depth+1);
  }
}
