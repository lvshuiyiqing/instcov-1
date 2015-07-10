//===-- SCAnalyzer.h ------------ SC analyzer class -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for short circuit MC/DC analyzer
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_SCANALYZER_H_
#define INSTCOV_SCANALYZER_H_

#include <vector>
#include <map>
#include <unordered_set>
#include <tuple>
#include <iostream>
#include <unordered_map>
#include "instcov/uuid.h"
#include "MCDCAnalyzer.h"

namespace instcov {
class SCAnalyzer : public MCDCAnalyzer {
 public:
  virtual void registerEntry(const LogEntry *entry, const LogMgr &LM);
  virtual void dump(std::ostream &OS, const LogMgr &LM) const;
  virtual void finalize(void);
  
  typedef std::string Assignment_t;
  typedef std::unordered_map<Assignment_t, std::vector<const LogEntry*> >
  Assgn2Entries_t;
  typedef std::pair<Assignment_t, Assignment_t> MCDCPair_t;
  typedef std::map<UUID_t, std::vector<MCDCPair_t> > CondPairs_t;
  typedef std::map<UUID_t, CondPairs_t> DecPairs_t;

 public:
  const DecPairs_t &getDec2Pairs(void) const { return Dec2Pairs; }
  const std::map<UUID_t, Assgn2Entries_t>
  &getDec2Assgn2Entries(void) const { return Dec2Assgn2Entries; }
  const std::map<UUID_t, std::vector<UUID_t> >
  &getDec2CondOrder(void) const { return Dec2CondOrder; }
  const std::map<UUID_t, std::size_t>
  &getUuid2AssgnPos(void) const { return Uuid2AssgnPos; }
  
 private:
  static size_t findMatch(const Assignment_t &LHS,
                          const Assignment_t &RHS);
  DecPairs_t Dec2Pairs;

  std::map<UUID_t, Assgn2Entries_t> Dec2Assgn2Entries;
  std::map<UUID_t, std::vector<UUID_t> > Dec2CondOrder;
  std::map<UUID_t, std::size_t> Uuid2AssgnPos;
};
}

#endif  // INSTCOV_SCANALYZER_H_
