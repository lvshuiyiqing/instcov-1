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
#include "DIBuilder4View.h"

namespace instcov {
class DISlotTree {
 public:
  DISlotTree(UUID_t Root, const DIBuilder4View &dib);
  ~DISlotTree(void);

  void dump(std::ostream &OS) const;
  void fill(UUID_t Uuid, uint64_t bid);
  bool canAccept(UUID_t Uuid) const;
  bool isFull(void) const { return NumEmptySlots == 0; }
  bool isRootFilled(void) const { return Records.count(R) != 0; }

 private:
  void printTreeDFS(std::ostream &OS,
                    UUID_t Uuid,
                    uint64_t depth) const;
  
 public:
  std::map<const UUID_t, uint64_t> Records;
  std::size_t NumEmptySlots;
  UUID_t R;
  const DIBuilder4View &DIB;
};
}

#endif  // INSTCOV_DISLOTTREE_H_
