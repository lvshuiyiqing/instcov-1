//===-- FastAnalyzer.cpp -- Fast MC/DC analyzer definitions -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions of FastAnalyzer
///
//===----------------------------------------------------------------------===//

#include <functional>
#include <algorithm>
#include "FastAnalyzer.h"
#include "llvm/Support/CommandLine.h"

using namespace llvm;
using namespace instcov;

extern cl::opt<bool> CountsOnly;
extern cl::opt<bool> Verbose;

void FastAnalyzer::registerEntry(const LogEntry *entry, const LogMgr &LM) {
  std::vector<bool> bits;
  std::vector<UUID_t> Uuids;
  bits.reserve(entry->Conditions.size()+1);
  Uuids.reserve(entry->Conditions.size()+1);
  for (auto &&Cond_Assgn : entry->Conditions) {
    if (Cond_Assgn.second == BID_NA) {
      std::cerr << "FastAnalyzer do not accept NA entries, skipping this one"
                << "<" << entry->TID << "," << entry->VID << ">" << std::endl;
    }
    bits.push_back(Cond_Assgn.second);
    Uuids.push_back(Cond_Assgn.first);
  }
  bits.push_back(entry->Decision.second);
  for (size_t i = 0; i < Uuids.size(); ++i) {
    if (bits[i]) {
      size_t hash_value = std::hash<std::vector<bool> >()(bits);
      Data[entry->Decision.first][Uuids[i]][hash_value]
          .TrueSide.push_back(entry);
    } else {
      // flip corresponding bits
      bits[i] = !bits[i];
      bits.back() = !bits.back();
      
      size_t hash_value = std::hash<std::vector<bool> >()(bits);
      Data[entry->Decision.first][Uuids[i]][hash_value]
          .FalseSide.push_back(entry);

      // flip back
      bits[i] = !bits[i];
      bits.back() = !bits.back();
    }
  }
}

void FastAnalyzer::finalize(void) {
}

void FastAnalyzer::dump(std::ostream &OS, const LogMgr &LM) const {
  // decision level
  auto dorder = getSortedIterators(Data, LM);
  for (auto &&it_Dec_Pairs : dorder) {
    OS << "Decision: " << it_Dec_Pairs->first.toString()
       << " (" << getLocString(LM, it_Dec_Pairs->first) << ")" << ":"
       << std::endl;
    auto corder =getSortedIterators(it_Dec_Pairs->second, LM);
    // condition level
    for (auto &&it_Cond_Pairs : corder) {
      OS << "Condition: " << it_Cond_Pairs->first.toString()
         << " (" << getLocString(LM, it_Cond_Pairs->first) << ")";
      bool IsCovered = false;
      // hash level
      for (auto &&Hash_Pairs : it_Cond_Pairs->second) {
        if (!Hash_Pairs.second.TrueSide.empty() &&
            !Hash_Pairs.second.FalseSide.empty()) {
          IsCovered = true;
          break;
        }
      }
      if (IsCovered) {
        OS << " > Covered" << std::endl;
      } else {
        OS << " > Uncovered" << std::endl;
      }

      if (!Verbose) {
        continue;
      }
      // Verbose dump
      for (auto &&Hash_Pairs : it_Cond_Pairs->second) {
        if (!Hash_Pairs.second.TrueSide.empty() &&
            !Hash_Pairs.second.FalseSide.empty()) {
          OS << "Hash (Covered): ";
        } else {
          OS << "Hash (Uncovered): ";
        }
        OS << Hash_Pairs.first << std::endl;
        OS << "True side: " << Hash_Pairs.second.TrueSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto &&Entry : Hash_Pairs.second.TrueSide) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        OS << std::endl;
        OS << "False side: " << Hash_Pairs.second.FalseSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto &&Entry : Hash_Pairs.second.FalseSide) {
            OS << "<" << Entry->TID << "," << Entry->VID << "> ";
          }
        }
        OS << std::endl;
      }
    }
  }
}
