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
#include "instcov/DbgInfoMgr.h"

namespace instcov {
struct RawRecord;

class RawRecordMgr {
 public:
  RawRecordMgr(const DbgInfoMgr &dim)
      : DIM(dim) {}
  ~RawRecordMgr(void);

 private:
  RawRecordMgr(const RawRecordMgr &from);
  const RawRecordMgr &operator = (const RawRecordMgr &right);

 public:
  const DbgInfoMgr &getDIM(void) const { return DIM; }
  const std::vector<RawRecord *> getRecords(void) const {
    return Records;
  }
  void loadFromFile(const std::string &FileName);

 private:
  std::vector<RawRecord *> Records;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_RAWRECORDMGR_H_
