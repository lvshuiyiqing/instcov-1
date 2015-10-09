//===-- FuncAnalyzer.h --- Function coverage analyzer class -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations ion of function coverage analyzer
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_FUNCANALYZER_H_
#define INSTCOV_FUNCANALYZER_H_

#include <set>
#include "instcov/RawRecord.h"
#include "instcov/DbgInfoMgr.h"

namespace instcov {
class FuncAnalyzer {
 public:
  FuncAnalyzer(const DbgInfoMgr &dim)
      : DIM(dim){}

 public:
  void registerRawRecord(const RawRecord *RR);
  void dump(std::ostream &OS) const;

 private:
  std::set<UUID_t> CoveredFuncUuids;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_FUNCANALYZER_H_
