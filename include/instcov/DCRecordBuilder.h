//===-- DCRecordBuilder.h ----- DCRecordBuilder declaration -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations of DCRecordBuilder
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DCRECORDBUILDER_H_
#define INSTCOV_DCRECORDBUILDER_H_

#include <map>
#include <deque>
#include <iostream>
#include "instcov/DbgInfoMgr.h"
#include "instcov/DCRecord.h"

namespace instcov {
class DCRecordBuilder {
 public:
  DCRecordBuilder(UUID_t Root, const DbgInfoMgr &dim);
  ~DCRecordBuilder(void);

  void fill(UUID_t Uuid, uint64_t bid);
  bool canAccept(UUID_t Uuid) const;
  bool isFull(void) const { return NumEmptySlots == 0; }
  bool isRootFilled(void) const { return Records.count(R) != 0; }
  DCRecord convert2DCRecord(void) const;

 private:
  void getUUIDsDFS(UUID_t Uuid, std::deque<UUID_t> &uuids) const;
 public:
  std::map<const UUID_t, uint64_t> Records;
  std::size_t NumEmptySlots;
  UUID_t R;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_DCRECORDBUILDER_H_
