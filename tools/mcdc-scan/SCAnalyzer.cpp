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

#include <algorithm>
#include "SCAnalyzer.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

extern cl::opt<bool> CountsOnly;
extern cl::opt<bool> Verbose;

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

bool isMatch(char LHS, char RHS) {
  return (LHS == RHS || LHS == 'N' || RHS == 'N');
}
}

void SCAnalyzer::registerEntry(const LogEntry *entry) {
  Assignment_t NewAssignment;
  std::vector<UUID_t> ThisCondOrder;
  NewAssignment.reserve(entry->Conditions.size()+1);
  for (auto it = entry->Conditions.begin(), ie = entry->Conditions.end();
       it != ie; ++it) {
    NewAssignment.push_back(bid2char(it->second));
    ThisCondOrder.push_back(it->first);
    Dec2Pairs[entry->Decision.first][it->first]; // register in the results
  }
  NewAssignment.push_back(bid2char(entry->Decision.second));
  Dec2Assgns[entry->Decision.first].push_back(NewAssignment);
  Assgn2Entries[NewAssignment].push_back(entry);
  Dec2CondOrder[entry->Decision.first] = ThisCondOrder;
}


void SCAnalyzer::finalize(void) {
  for (auto itd = Dec2Assgns.begin(), ied = Dec2Assgns.end();
       itd != ied; ++itd) {
    for (auto it1 = itd->second.begin(),
             ie = itd->second.end(); it1 != ie; ++it1) {
      auto it2 = it1;
      ++it2;
      for (; it2 != ie; ++it2) {
        size_t MatchedID = findMatch(*it1, *it2);
        if (MatchedID != (size_t)-1) {
          UUID_t Uuid_D = itd->first;
          UUID_t Uuid_C = Dec2CondOrder[Uuid_D][MatchedID];
          if ((*it1)[MatchedID] == 'T') {
            Dec2Pairs[Uuid_D][Uuid_C].push_back(
                std::make_pair(*it1, *it2));
          } else {
            Dec2Pairs[Uuid_D][Uuid_C].push_back(
                std::make_pair(*it2, *it1));
          }
        }
      }
    }
  }
}

size_t SCAnalyzer::findMatch(const Assignment_t &LHS,
                             const Assignment_t &RHS) {
  if (LHS.empty() || RHS.empty() || LHS.size() != RHS.size()) {
    return -1;
  }
  if (isMatch(LHS.back(), RHS.back())) {
    return -1;
  }
  size_t ID = -1;
  for (size_t i = 0, e = LHS.size() - 1; i < e; ++i) {
    if (isMatch(LHS[i], RHS[i])) {
      if (ID != (size_t)-1) {
        return -1;
      }
      ID = i;
    }
  }
  return ID;
}

std::vector<SCAnalyzer::DecPairs_t::const_iterator>
SCAnalyzer::getSortedDecisions(
    const SCAnalyzer::DecPairs_t &D, const LogMgr &LM) {
  std::vector<DecPairs_t::const_iterator> vec;
  for (auto it = D.begin(), ie = D.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(LM));
  return vec;
}

std::vector<SCAnalyzer::CondPairs_t::const_iterator>
SCAnalyzer::getSortedConditions(
    const SCAnalyzer::CondPairs_t &C, const LogMgr &LM) {
  std::vector<CondPairs_t::const_iterator> vec;
  for (auto it = C.begin(), ie = C.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(LM));
  return vec;
}

void SCAnalyzer::dump(std::ostream &OS, const LogMgr &LM) const {
  // decision level
  auto dorder = getSortedDecisions(Dec2Pairs, LM);
  for (auto itd = dorder.begin(), ied = dorder.end(); itd != ied; ++itd) {
    UUID_t Uuid_D = (*itd)->first;
    OS << "Decision: " << (*itd)->first.toString()
       << " (" << getLocString(LM, (*itd)->first) << ")" << ":" << std::endl;
    // condition level
    auto corder = getSortedConditions((*itd)->second, LM);
    for (auto itc = corder.begin(), iec = corder.end(); itc != iec; ++itc) {
      OS << "Condition: " << (*itc)->first.toString()
         << " (" << getLocString(LM, (*itc)->first) << ")";
      if ((*itc)->second.empty()) {
        OS << " > Uncovered" << std::endl;
      } else {
        OS << " > Covered" << std::endl;
      }
      if (!Verbose) {
        continue;
      }
      // assgn pair level
      for (auto itp = (*itc)->second.begin(), iep = (*itc)->second.end();
           itp != iep; ++itp) {
        OS << "Pair: <" << itp->first << ","
           << itp->second << ">" << std::endl;
        auto &TrueSideEntries = Assgn2Entries.find(itp->first)->second;
        auto &FalseSideEntries = Assgn2Entries.find(itp->second)->second;
        OS << "True side: " << TrueSideEntries.size() << std::endl;
        if (!CountsOnly) {
          for (auto ita = TrueSideEntries.begin(), iea = TrueSideEntries.end();
               ita != iea; ++ita) {
            OS << "<" << (*ita)->FID << "," << (*ita)->RID << "> ";
          }
        }
        OS << "False side: " << FalseSideEntries.size() << std::endl;
        if (!CountsOnly) {
          for (auto ita = FalseSideEntries.begin(), iea = FalseSideEntries.end();
               ita != iea; ++ita) {
            OS << "<" << (*ita)->FID << "," << (*ita)->RID << "> ";
          }
        }
      }
    }
  }
}
