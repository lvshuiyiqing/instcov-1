//===-- MCDCAnalyzerSC.cpp -------- SC analyzer definitions -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for short-circuit MCDC analyzer
///
//===----------------------------------------------------------------------===//

#include <algorithm>
#include "instcov/RawRecord.h"
#include "MCDCAnalyzerSC.h"
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
    return 'X';
  }
  std::cerr << "invalid BID" << std::endl;
  exit(1);
  return 'Z';
}

bool isMatch(char LHS, char RHS) {
  return (LHS == RHS || LHS == 'X' || RHS == 'X');
}
}

void MCDCAnalyzerSC::registerDCRecord(const DCRecord *DCR) {
  EvalVec_t NewEV;
  std::vector<UUID_t> ThisCondOrder;
  NewEV.reserve(DCR->Cond2Val.size()+1);
  auto corder = getSortedIterators(DCR->Cond2Val, DIM);
  for (auto &it_Cond_Val : corder) {
    Uuid2EVPos[it_Cond_Val->first] = NewEV.size();
    NewEV.push_back(bid2char(it_Cond_Val->second));
    ThisCondOrder.push_back(it_Cond_Val->first);
    Dec2Pairs[DCR->DecVal.first][it_Cond_Val->first]; // register in the results
  }
  Uuid2EVPos[DCR->DecVal.first] = NewEV.size();
  NewEV.push_back(bid2char(DCR->DecVal.second));
  Dec2EV2TIDs[DCR->DecVal.first][NewEV].insert(DCR->TID);
  Dec2CondOrder[DCR->DecVal.first] = ThisCondOrder;
}

void MCDCAnalyzerSC::finalize(void) {
  for (auto &Dec_EV2TIDs : Dec2EV2TIDs) {
    UUID_t Uuid_D = Dec_EV2TIDs.first;
    for (auto it1 = Dec_EV2TIDs.second.begin(),
             ie = Dec_EV2TIDs.second.end(); it1 != ie; ++it1) {
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

size_t MCDCAnalyzerSC::findMatch(const EvalVec_t &LHS,
                                 const EvalVec_t &RHS) {
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

void MCDCAnalyzerSC::dump(std::ostream &OS) const {
  std::size_t NumCovered = 0;
  std::size_t NumUncovered = 0;
  // decision level
  auto dorder = getSortedIterators(Dec2Pairs, DIM);
  for (auto &it_Dec_Pairs : dorder) {
    UUID_t UuidD = it_Dec_Pairs->first;
    OS << UuidD.toString()
       << " (" << getLocString(DIM, it_Dec_Pairs->first) << ")"
       << ":" << std::endl;
    // condition level
    auto corder = getSortedIterators(it_Dec_Pairs->second, DIM);
    for (auto &it_Cond_Pairs : corder) {
      OS << "-" << it_Cond_Pairs->first.toString()
         << " (" << getLocString(DIM, it_Cond_Pairs->first) << ")";
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
      for (auto &Pair : it_Cond_Pairs->second) {
        OS << "Pair: <" << Pair.first << ","
           << Pair.second << ">" << std::endl;
        auto &TrueSideTIDs =
            Dec2EV2TIDs.find(UuidD)->second.find(Pair.first)->second;
        auto &FalseSideTIDs =
            Dec2EV2TIDs.find(UuidD)->second.find(Pair.second)->second;
        OS << "True side: " << TrueSideTIDs.size() << std::endl;
        if (!CountsOnly) {
          for (auto TID : TrueSideTIDs) {
            OS << TID << " ";
          }
        }
        std::cout << std::endl;
        OS << "False side: " << FalseSideTIDs.size() << std::endl;
        if (!CountsOnly) {
          for (auto TID : FalseSideTIDs) {
            OS << TID << " ";
          }
        }
        std::cout << std::endl;
      }
    }
  }
  OS << "SUMMARY: " << NumCovered << "/" << NumCovered + NumUncovered
     << " covered" << std::endl;
}
