//===-- MCDCAnalyzer.h ------- MC/DC analyzer class -------------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the abstract class for MCDC analyzers
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_MCDCANALYZER_H_
#define INSTCOV_MCDCANALYZER_H_

#include "instcov/DCRecord.h"
#include "instcov/DbgInfoMgr.h"

namespace instcov {
class MCDCAnalyzer {
 public:
  enum AnalyzerKind {
    AK_Fast,
    AK_SC,
  };
 private:
  const AnalyzerKind Kind;

 public:
  virtual ~MCDCAnalyzer(void) {}
  AnalyzerKind getKind() const { return Kind; }

  MCDCAnalyzer(AnalyzerKind K, const DbgInfoMgr &dim)
      : Kind(K), DIM(dim) {}

  virtual void registerDCRecord(const DCRecord *DCR) = 0;
  virtual void dump(std::ostream &OS) const = 0;
  virtual void finalize(void) = 0;
  const DbgInfoMgr &getDIM(void) const { return DIM; }

 public:
  static std::string getLocString(const DbgInfoMgr &DIM, UUID_t Uuid) {
    if (DIM.isExist(Uuid)) {
      return DIM.getDbgInfo(Uuid)->Loc.toString();
    }
    return "NA";
  }
 protected:
  const DbgInfoMgr &DIM;
};
}

#endif  // INSTCOV_MCDCANALYZER_H_
