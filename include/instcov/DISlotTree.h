//===-- DISlotTree.h ----- debug info slot tree declaration -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations of the tree for debug info
/// slots (to be/already) read from the trace file
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DISLOTTREE_H_
#define INSTCOV_DISLOTTREE_H_

#include <map>
#include <iostream>
#include "instcov/DbgInfoDB.h"

namespace instcov {
class DISlotTree {
 public:
  DISlotTree(DbgInfoEntry_View *Root);
  ~DISlotTree(void);

  void dump(std::ostream &OS) const;
  void fill(DbgInfoEntry_View *Node, uint64_t bid);
  bool canAccept(DbgInfoEntry_View *Node) const;
  bool isFull(void) const { return NumEmptySlots == 0; }
  bool isRootFilled(void) const { return Records.count(R) != 0; }

 private:
  void printTreeDFS(std::ostream &OS,
                    const DbgInfoEntry_View *Node,
                    uint64_t depth) const;

 public:
  std::map<const DbgInfoEntry_View *, uint64_t> Records;
  int64_t NumEmptySlots;
  DbgInfoEntry_View *R;
};
}

#endif  // INSTCOV_DISLOTTREE_H_
