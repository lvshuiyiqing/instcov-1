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

void SCAnalyzer::registerEntry(const LogEntry *entry, const LogMgr &LM) {
  Assignment_t NewAssignment;
  std::vector<UUID_t> ThisCondOrder;
  NewAssignment.reserve(entry->Conditions.size()+1);
  auto corder = getSortedIterators(entry->Conditions, LM);
  for (auto &&it_Cond_Assgn : corder) {
    Uuid2AssgnPos[it_Cond_Assgn->first] = NewAssignment.size();
    NewAssignment.push_back(bid2char(it_Cond_Assgn->second));
    ThisCondOrder.push_back(it_Cond_Assgn->first);
    Dec2Pairs[entry->Decision.first][it_Cond_Assgn->first]; // register in the results
  }
  Uuid2AssgnPos[entry->Decision.first] = NewAssignment.size();
  NewAssignment.push_back(bid2char(entry->Decision.second));
  Dec2Assgn2Entries[entry->Decision.first][NewAssignment].push_back(entry);
  Dec2CondOrder[entry->Decision.first] = ThisCondOrder;
}

void SCAnalyzer::finalize(void) {
  for (auto &&Dec_Assgn2Entries : Dec2Assgn2Entries) {
    UUID_t Uuid_D = Dec_Assgn2Entries.first;
    for (auto it1 = Dec_Assgn2Entries.second.begin(),
             ie = Dec_Assgn2Entries.second.end(); it1 != ie; ++it1) {
      auto it2 = it1;
      ++it2;
      for (; it2 != ie; ++it2) {
        size_t MatchedID = findMatch(it1->first, it2->first);
        if (MatchedID != (size_t)-1) {
          UUID_t Uuid_C = Dec2CondOrder[Uuid_D][MatchedID];
          if (it1->first[MatchedID] == 'T') {
            Dec2Pairs[Uuid_D][Uuid_C].push_back(
                std::make_pair(it1->first, it2->first));
          } else {
            Dec2Pairs[Uuid_D][Uuid_C].push_back(
                std::make_pair(it2->first, it1->first));
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
    if (!isMatch(LHS[i], RHS[i])) {
      if (ID != (size_t)-1) {
        return -1;
      }
      ID = i;
    }
  }
  return ID;
}

void SCAnalyzer::dump(std::ostream &OS, const LogMgr &LM) const {
  std::size_t NumCovered = 0;
  std::size_t NumUncovered = 0;
  // decision level
  auto dorder = getSortedIterators(Dec2Pairs, LM);
  for (auto &&it_Dec_Pairs : dorder) {
    UUID_t UuidD = it_Dec_Pairs->first;
    OS << UuidD.toString()
       << " (" << getLocString(LM, it_Dec_Pairs->first) << ")"
       << ":" << std::endl;
    // condition level
    auto corder = getSortedIterators(it_Dec_Pairs->second, LM);
    for (auto &&it_Cond_Pairs : corder) {
      OS << "-" << it_Cond_Pairs->first.toString()
         << " (" << getLocString(LM, it_Cond_Pairs->first) << ")";
      if (it_Cond_Pairs->second.empty()) {
        OS << " > Uncovered" << std::endl;
        ++NumUncovered;
      } else {
        OS << " > Covered" << std::endl;
        ++NumCovered;
      }
      if (!Verbose) {
        continue;
      }
      // assgn pair level
      for (auto &&Pair : it_Cond_Pairs->second) {
        OS << "Pair: <" << Pair.first << ","
           << Pair.second << ">" << std::endl;
        auto &TrueSideEntries =
            Dec2Assgn2Entries.find(UuidD)->second.find(Pair.first)->second;
        auto &FalseSideEntries =
            Dec2Assgn2Entries.find(UuidD)->second.find(Pair.second)->second;
        OS << "True side: " << TrueSideEntries.size() << std::endl;
        if (!CountsOnly) {
          for (auto &&Entry : TrueSideEntries) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        std::cout << std::endl;
        OS << "False side: " << FalseSideEntries.size() << std::endl;
        if (!CountsOnly) {
          for (auto &&Entry : FalseSideEntries) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        std::cout << std::endl;
      }
    }
  }
  OS << "SUMMARY: " << NumCovered << "/" << NumCovered + NumUncovered
     << "covered" << std::endl;
}
