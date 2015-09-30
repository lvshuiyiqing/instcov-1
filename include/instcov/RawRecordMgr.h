//===-- RawRecordMgr.h -- raw trace record manager declaration --*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for raw trace record manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RAWRECORDMGR_H_
#define INSTCOV_RAWRECORDMGR_H_

#include <vector>
#include <string>
#include <memory>
#include "instcov/RecordItem.h"
#include "instcov/DbgInfoMgr.h"

namespace instcov {
class RawRecordMgr {
 public:
  RawRecordMgr(const DbgInfoMgr &dim)
      : DIM(dim) {}
  ~RawRecordMgr(void) {}

 private:
  RawRecordMgr(const RawRecordMgr &from);
  const RawRecordMgr &operator = (const RawRecordMgr &right);

 public:
  const DbgInfoMgr &getDIM(void) const { return DIM; }
  const std::vector<RecordItem *> getRecordItems(void) const {
    return RecordItems;
  }
  void loadFromFile(const std::string &FileName);

 private:
  std::vector<RecordItem *> RecordItems;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_RAWRECORDMGR_H_
