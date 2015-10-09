//===-- DCAnalyzer.h -------- DC coverage analyzer class --------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations ion of Decision/Condition
/// \brief coverage analyzer
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DCANALYZER_H_
#define INSTCOV_DCANALYZER_H_

#include <set>
#include <utility>
#include "instcov/RawRecord.h"
#include "instcov/DbgInfoMgr.h"

namespace instcov {
class DCAnalyzer {
 public:
  DCAnalyzer(const DbgInfoMgr &dim)
      : DIM(dim){}

 public:
  void registerRawRecord(const RawRecord *RR);
  void dump(std::ostream &OS) const;

 private:
  void dumpDFS(std::ostream &OS, UUID_t Uuid, std::size_t depth) const;
  std::map<UUID_t, std::pair<bool, bool> > CoveredDCs;
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_DCANALYZER_H_
