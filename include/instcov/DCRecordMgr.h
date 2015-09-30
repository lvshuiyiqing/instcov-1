//===-- DCRecordMgr.h --- DC trace record manager declaration ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for DC trace record manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RECORDMGR_H_
#define INSTCOV_RECORDMGR_H_

#include <vector>
#include <string>
#include <memory>
#include "instcov/DISlotTree.h"
#include "llvm/Support/raw_ostream.h"

namespace instcov {
class RecordMgr {
 public:
  RecordMgr(const DbgInfoMgr &dim)
      : DIM(dim) {}
  ~RecordMgr(void) {}

 private:
  RecordMgr(const RecordMgr &from);
  const RecordMgr &operator = (const RecordMgr &right);

 public:
  const DbgInfoMgr &getDIM(void) { return DIM; }
  std::vector<std::shared_ptr<DISlotTree> > &getRecordTrees(void) {
    return RecordTrees;
  }
  const std::vector<std::shared_ptr<DISlotTree> > &getRecordTrees(void) const {
    return RecordTrees;
  }
  void processTrace(const std::string &FileName);

  void dump(std::ostream &OS) const;

 private:
  const DbgInfoMgr &DIM;
  std::vector<std::shared_ptr<DISlotTree> > RecordTrees;
};
}

#endif  // INSTCOV_RECORDMGR_H_
