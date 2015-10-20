//===-- MCDCAnalyzerSC.h -------- SC analyzer class -------------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for short circuit MC/DC analyzer
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_MCDCANALYZERSC_H_
#define INSTCOV_MCDCANALYZERSC_H_

#include <vector>
#include <map>
#include <unordered_set>
#include <tuple>
#include <iostream>
#include <unordered_map>
#include "instcov/uuid.h"
#include "MCDCAnalyzer.h"

namespace instcov {
class MCDCAnalyzerSC : public MCDCAnalyzer {
 public:
  MCDCAnalyzerSC(const DbgInfoMgr &dim)
      : MCDCAnalyzer(AK_SC, dim) {}

  static bool classof(const MCDCAnalyzer *A) {
    return A->getKind() == AK_SC;
  }

 public:
  virtual void registerDCRecord(const DCRecord *DCR);
  virtual void dump(std::ostream &OS) const;
  virtual void finalize(void);

  typedef std::string EvalVec_t;
  typedef std::unordered_map<EvalVec_t, std::set<std::size_t> >
  EV2TIDs_t;
  typedef std::pair<EvalVec_t, EvalVec_t> MCDCPair_t;
  typedef std::map<UUID_t, std::vector<MCDCPair_t> > CondPairs_t;
  typedef std::map<UUID_t, CondPairs_t> DecPairs_t;

 public:
  const DecPairs_t &getDec2Pairs(void) const { return Dec2Pairs; }
  const std::map<UUID_t, EV2TIDs_t>
  &getDec2EV2TIDs(void) const { return Dec2EV2TIDs; }
  const std::map<UUID_t, std::vector<UUID_t> >
  &getDec2CondOrder(void) const { return Dec2CondOrder; }
  const std::map<UUID_t, std::size_t>
  &getUuid2EVPos(void) const { return Uuid2EVPos; }

 private:
  static size_t findMatch(const EvalVec_t &LHS,
                          const EvalVec_t &RHS);
  DecPairs_t Dec2Pairs;

  std::map<UUID_t, EV2TIDs_t> Dec2EV2TIDs;
  std::map<UUID_t, std::vector<UUID_t> > Dec2CondOrder;
  std::map<UUID_t, std::size_t> Uuid2EVPos;
};
}

#endif  // INSTCOV_MCDCANALYZERSC_H_
