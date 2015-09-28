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
#include <deque>
#include <iostream>
#include "instcov/DbgInfoMgr.h"
#include "instcov/LogMgr.h"

namespace instcov {
class DISlotTree {
 public:
  DISlotTree(UUID_t Root, const DbgInfoMgr &dim);
  ~DISlotTree(void);

  void dump(std::ostream &OS) const;
  void fill(UUID_t Uuid, uint64_t bid);
  bool canAccept(UUID_t Uuid) const;
  bool isFull(void) const { return NumEmptySlots == 0; }
  bool isRootFilled(void) const { return Records.count(R) != 0; }
  LogEntry convert2LogEntry(void) const;

 private:
  void printTreeDFS(std::ostream &OS,
                    UUID_t Uuid,
                    uint64_t depth) const;
  void getUUIDsDFS(UUID_t Uuid, std::deque<UUID_t> &uuids) const;
 public:
  std::map<const UUID_t, uint64_t> Records;
  std::size_t NumEmptySlots;
  UUID_t R;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_DISLOTTREE_H_
