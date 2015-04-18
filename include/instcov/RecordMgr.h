//===-- RecordMgr.h ------ trace record manager declaration -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for trace record manager
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RECORDMGR_H_
#define INSTCOV_RECORDMGR_H_

#include <vector>
#include "DbgInfoDB.h"
#include "DISlotTree.h"

namespace instcov {
class RecordMgr {
 public:
  RecordMgr(void) {}
  ~RecordMgr(void) {}

 private:
  RecordMgr(const RecordMgr &from);
  const RecordMgr &operator = (const RecordMgr &right);

 public:
  DbgInfoDB &getDIBB(void) { return DIDB; }
  std::vector<std::shared_ptr<DISlotTree> > &getRecordTrees(void) {
    return RecordTrees;
  }
  void processTrace(llvm::StringRef TraceFile);

 private:
  DbgInfoDB DIDB;
  std::vector<std::shared_ptr<DISlotTree> > RecordTrees;
};
}

#endif  // INSTCOV_RECORDMGR_H_
