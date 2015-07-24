//===-- MCDCAnalyzer.h ------- MC/DC analyzer class -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the abstract class for MCDC analyzers
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_MCDCANALYZER_H_
#define INSTCOV_MCDCANALYZER_H_

#include "instcov/LogMgr.h"

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
  AnalyzerKind getKind() const { return Kind; }

  MCDCAnalyzer(AnalyzerKind K) : Kind(K) {}

  virtual void registerEntry(const LogEntry *entry, const LogMgr &LM) = 0;
  virtual void dump(std::ostream &OS, const LogMgr &LM) const = 0;
  virtual void finalize(void) = 0;

 public:
  static std::string getLocString(const LogMgr &LM, UUID_t Uuid) {
    if (LM.getLocInfos().count(Uuid)) {
      return LM.getLocInfos().find(Uuid)->second.toString();
    }
    return "NA";
  }
};
}

#endif  // INSTCOV_MCDCANALYZER_H_
