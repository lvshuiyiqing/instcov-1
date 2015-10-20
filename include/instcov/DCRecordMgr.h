//===-- DCRecordMgr.h ------- dc record manager declaration -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for dc record manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DCRECORDMGR_H_
#define INSTCOV_DCRECORDMGR_H_

#include <vector>
#include <string>
#include <memory>
#include "llvm/Support/raw_ostream.h"
#include "RawRecordMgr.h"

namespace instcov {
class RawRecordMgr;
class DbgInfoMgr;
class DCRecordBuilder;

class DCRecordMgr {
 public:
  DCRecordMgr(const DbgInfoMgr &dim)
      : DIM(dim) {}
  ~DCRecordMgr(void) {}

 private:
  DCRecordMgr(const DCRecordMgr &from);
  const DCRecordMgr &operator = (const DCRecordMgr &right);

 public:
  const DbgInfoMgr &getDIM(void) { return DIM; }
  std::vector<std::shared_ptr<DCRecordBuilder> > &getRecordBuilders(void) {
    return RecordBuilders;
  }
  const std::vector<std::shared_ptr<DCRecordBuilder> >
  &getRecordBuilders(void) const {
    return RecordBuilders;
  }
  void processTrace(const RawRecordMgr &RM);

 private:
  const DbgInfoMgr &DIM;
  std::vector<std::shared_ptr<DCRecordBuilder> > RecordBuilders;
};
}

#endif  // INSTCOV_DCRECORDMGR_H_
