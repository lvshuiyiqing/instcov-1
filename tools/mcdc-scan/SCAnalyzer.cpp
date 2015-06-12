//===-- SCAnalyzer.cpp ------ SC analyzer class definitions -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for SCAnalyzer
///
//===----------------------------------------------------------------------===//

#include "SCAnalyzer.h"

using namespace instcov;

namespace {
char bid2char(uint64_t bid) {
  if (bid == 1) {
    return 'T';
  }
  if (bid == 0) {
    return 'F';
  }
  if (bid == BID_NA) {
    return 'N';
  }
  std::cerr << "invalid BID" << std::endl;
  exit(1);
  return 'Z';
}
}

void SCAnalyzer::registerEntry(const LogEntry *entry) {
  Assignment_t NewAssignment;
  std::vector<UUID_t> ThisUuidOrder;
  NewAssignment.reserve(entry->Conditions.size()+1);
  for (auto it = entry->Conditions.begin(), ie = entry->Conditions.end();
       it != ie; ++it) {
    NewAssignment.push_back(bid2char(it->second));
    ThisUuidOrder.push_back(it->first);
  }
  NewAssignment.push_back(bid2char(entry->Decision.second));
  SortedEntries[NewAssignment].push_back(entry);
  UuidOrder[entry->Decision.first] = ThisUuidOrder;
}


void SCAnalyzer::finalize(void) {
  for (auto it1 = SortedEntries.begin(), ie = SortedEntries.end();
       it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      size_t MatchedID = findMatch(it1->first, it2->first);
      if (MatchedID != (size_t)-1) {
        const LogEntry *LE = it1->second.front();
        UUID_t Uuid_D = LE->Decision.first;
        UUID_t Uuid_C = UuidOrder[Uuid_D][MatchedID];
        DecisionInfo[Uuid_D][Uuid_C].push_back(
            std::make_pair(it1->first, it2->first));
      }
    }
  }
}

size_t SCAnalyzer::findMatch(const Assignment_t &LHS,
                             const Assignment_t &RHS) {
  if (LHS.empty() || RHS.empty() || LHS.size() != RHS.size()) {
    return -1;
  }
  if (LHS[0] == RHS[0]) {
    return -1;
  }
  size_t ID = -1;
  for (size_t i = 1; i < LHS.size(); ++i) {
    if (LHS[i] != RHS[i]) {
      if (ID != (size_t)-1) {
        return -1;
      }
      ID = i-1;
    }
  }
  return ID;
}

void SCAnalyzer::dump(std::ostream &OS, const LogMgr &LM) const {
}
