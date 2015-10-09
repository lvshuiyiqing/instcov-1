//===-- MCDCAnalyzerFast.cpp -- FastMCDCAnalyzer definitions ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions of fast MC/DC analyzer
///
//===----------------------------------------------------------------------===//

#include <functional>
#include <algorithm>
#include "instcov/RawRecord.h"
#include "MCDCAnalyzerFast.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

extern cl::opt<bool> CountsOnly;
extern cl::opt<bool> Verbose;

void MCDCAnalyzerFast::registerDCRecord(const DCRecord *DCR) {
  std::vector<bool> bits;
  std::vector<UUID_t> Uuids;
  bits.reserve(DCR->Cond2Val.size()+1);
  Uuids.reserve(DCR->Cond2Val.size()+1);
  for (auto &Cond_Assgn : DCR->Cond2Val) {
    if (Cond_Assgn.second == BID_NA) {
      std::cerr << "MCDCAnalyzerFast do not accept NA entries, skipping"
                << "<" << DCR->TID << "," << DCR->VID << ">" << std::endl;
    }
    bits.push_back(Cond_Assgn.second);
    Uuids.push_back(Cond_Assgn.first);
  }
  bits.push_back(DCR->DecVal.second);
  for (size_t i = 0; i < Uuids.size(); ++i) {
    if (bits[i]) {
      size_t hash_value = std::hash<std::vector<bool> >()(bits);
      Data[DCR->DecVal.first][Uuids[i]][hash_value]
          .TrueSide.push_back(DCR);
    } else {
      // flip corresponding bits
      bits[i] = !bits[i];
      bits.back() = !bits.back();

      size_t hash_value = std::hash<std::vector<bool> >()(bits);
      Data[DCR->DecVal.first][Uuids[i]][hash_value]
          .FalseSide.push_back(DCR);

      // flip back
      bits[i] = !bits[i];
      bits.back() = !bits.back();
    }
  }
}

void MCDCAnalyzerFast::finalize(void) {
}

void MCDCAnalyzerFast::dump(std::ostream &OS) const {
  std::size_t NumCovered = 0;
  std::size_t NumUncovered = 0;
  // decision level
  auto dorder = getSortedIterators(Data, DIM);
  for (auto &it_Dec_Pairs : dorder) {
    OS << it_Dec_Pairs->first.toString()
       << " (" << getLocString(DIM, it_Dec_Pairs->first) << ")" << ":"
       << std::endl;
    auto corder =getSortedIterators(it_Dec_Pairs->second, DIM);
    // condition level
    for (auto &it_Cond_Pairs : corder) {
      OS << "-" << it_Cond_Pairs->first.toString()
         << " (" << getLocString(DIM, it_Cond_Pairs->first) << ")";
      bool IsCovered = false;
      // hash level
      for (auto &Hash_Pairs : it_Cond_Pairs->second) {
        if (!Hash_Pairs.second.TrueSide.empty() &&
            !Hash_Pairs.second.FalseSide.empty()) {
          IsCovered = true;
          break;
        }
      }
      if (IsCovered) {
        OS << " > Covered" << std::endl;
        ++NumCovered;
      } else {
        OS << " > Uncovered" << std::endl;
        ++NumUncovered;
      }

      if (!Verbose) {
        continue;
      }
      // Verbose dump
      for (auto &Hash_Pairs : it_Cond_Pairs->second) {
        if (!Hash_Pairs.second.TrueSide.empty() &&
            !Hash_Pairs.second.FalseSide.empty()) {
          OS << "Hash (Covered): ";
        } else {
          OS << "Hash (Uncovered): ";
        }
        OS << Hash_Pairs.first << std::endl;
        OS << "True side: " << Hash_Pairs.second.TrueSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto &Entry : Hash_Pairs.second.TrueSide) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        OS << std::endl;
        OS << "False side: " << Hash_Pairs.second.FalseSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto &Entry : Hash_Pairs.second.FalseSide) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        OS << std::endl;
      }
    }
  }
  OS << "SUMMARY: " << NumCovered << "/" << NumCovered + NumUncovered
     << " covered" << std::endl;
}
