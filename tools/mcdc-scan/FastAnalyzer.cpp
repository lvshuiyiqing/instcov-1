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

void FastAnalyzer::registerEntry(const LogEntry *entry) {
  std::vector<bool> bits;
  std::vector<UUID_t> Uuids;
  bits.reserve(entry->Conditions.size()+1);
  Uuids.reserve(entry->Conditions.size()+1);
  for (auto it = entry->Conditions.begin(), ie = entry->Conditions.end();
       it != ie; ++it) {
    bits.push_back(it->second);
    Uuids.push_back(it->first);
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

std::vector<FastAnalyzer::Data_t::const_iterator>
FastAnalyzer::getSortedDecisions(
    const FastAnalyzer::Data_t &Data, const LogMgr &LM) {
  std::vector<FastAnalyzer::Data_t::const_iterator> vec;
  for (auto it = Data.begin(), ie = Data.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(LM));
  return vec;
}

std::vector<FastAnalyzer::DData_t::const_iterator>
FastAnalyzer::getSortedConditions(
    const FastAnalyzer::DData_t &DData, const LogMgr &LM) {
  std::vector<FastAnalyzer::DData_t::const_iterator> vec;
  for (auto it = DData.begin(), ie = DData.end(); it != ie; ++it) {
    vec.push_back(it);
  }
  std::sort(vec.begin(), vec.end(), LocSorter(LM));
  return vec;
}

void FastAnalyzer::dump(std::ostream &OS, const LogMgr &LM) const {
  // decision level
  auto dorder = getSortedDecisions(Data, LM);
  for (auto itd = dorder.begin(), ied = dorder.end(); itd != ied; ++itd) {
    OS << "Decision: " << (*itd)->first.toString()
       << " (" << getLocString(LM, (*itd)->first) << ")" << ":" << std::endl;
    auto corder =getSortedConditions((*itd)->second, LM);
    // condition level
    for (auto itc = corder.begin(), iec = corder.end();
         itc != iec; ++itc) {
      OS << "Condition: " << (*itc)->first.toString()
         << " (" << getLocString(LM, (*itc)->first) << ")";
      bool IsCovered = false;
      // hash level
      for (auto ith = (*itc)->second.begin(), ieh = (*itc)->second.end();
           ith != ieh; ++ith) {
        if (!ith->second.TrueSide.empty() && !ith->second.FalseSide.empty()) {
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
      for (auto ith = (*itc)->second.begin(), ieh = (*itc)->second.end();
           ith != ieh; ++ith) {
        if (!ith->second.TrueSide.empty() && !ith->second.FalseSide.empty()) {
          OS << "Hash (Covered): ";
        } else {
          OS << "Hash (Uncovered): ";
        }
        OS << ith->first << std::endl;
        OS << "True side: " << ith->second.TrueSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto ite = ith->second.TrueSide.begin(),
                   iee = ith->second.TrueSide.end();
               ite != iee; ++ite) {
            OS << "<" << (*ite)->FID << "," << (*ite)->RID << "> ";
          }
        }
        OS << std::endl;
        OS << "False side: " << ith->second.FalseSide.size() << std::endl;
        if (!CountsOnly) {
          for (auto ite = ith->second.FalseSide.begin(),
                   iee = ith->second.FalseSide.end();
               ite != iee; ++ite) {
            OS << "<" << (*ite)->FID << "," << (*ite)->RID << "> ";
          }
        }
        OS << std::endl;
      }
    }
  }
}
