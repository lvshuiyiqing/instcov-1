//===-- MCDCAnalyzer.cpp ------- MC/DC analyzer definitions -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for trace log manager
///
//===----------------------------------------------------------------------===//

#include <functional>
#include "MCDCAnalyzer.h"

using namespace instcov;

void MCDCAnalyzer::registerEntry(const LogEntry *entry) {
  std::vector<bool> bits, flipped_bits;
  bits.reserve(entry->Conditions.size()+1);
  flipped_bits.reserve(entry->Conditions.size()+1);
  for (auto it = entry->Conditions.begin(), ie = entry->Conditions.end();
       it != ie; ++it) {
    bits.push_back(it->second);
    flipped_bits.push_back(it->second != 0);
  }
  bits.push_back(entry->Decision.second);
  flipped_bits.push_back(entry->Decision.second != 0);
  size_t hash_value = std::hash<std::vector<bool> >()(bits);
  size_t flipped_hash_value = std::hash<std::vector<bool> >()(flipped_bits);
  for (auto it = entry->Conditions.begin(), ie = entry->Conditions.end();
       it != ie; ++it) {
    if (it->second) {
      Data[entry->Decision.first][it->first][hash_value]
          .TrueSide.push_back(entry);
    } else {
      Data[entry->Decision.first][it->first][flipped_hash_value]
          .FalseSide.push_back(entry);      
    }
  }
}

void MCDCAnalyzer::getResult(
    std::vector<std::pair<UUID_t, UUID_t> > &covered,
    std::vector<std::pair<UUID_t, UUID_t> > &uncovered) const {
  // decision level
  for (auto itd = Data.begin(), ied = Data.end(); itd != ied; ++itd) {
    // condition level
    for (auto itc = itd->second.begin(), iec = itd->second.end();
         itc != iec; ++itc) {
      bool IsCovered = false;
      // hash level
      for (auto ith = itc->second.begin(), ieh = itc->second.end();
           ith != ieh; ++ith) {
        if (!ith->second.TrueSide.empty() && !ith->second.FalseSide.empty()) {
          IsCovered = true;
          break;
        }
      }
      if (IsCovered) {
        covered.push_back(std::make_pair(itd->first, itc->first));
      } else {
        uncovered.push_back(std::make_pair(itd->first, itc->first));
      }
    }
  }
}

void MCDCAnalyzer::dump(std::ostream &os) const {
  // decision level
  for (auto itd = Data.begin(), ied = Data.end(); itd != ied; ++itd) {
    os << "Decision: " << itd->first.toString() << std::endl;
    // condition level
    for (auto itc = itd->second.begin(), iec = itd->second.end();
         itc != iec; ++itc) {
      os << "Condition: " << itc->first.toString() << std::endl;
      // hash level
      for (auto ith = itc->second.begin(), ieh = itc->second.end();
           ith != ieh; ++ith) {
        if (!ith->second.TrueSide.empty() && !ith->second.FalseSide.empty()) {
          os << "Hash (Covered): ";
        } else {
          os << "Hash (Uncovered): ";
        }
        os << ith->first << std::endl;
        os << "True side: ";
        for (auto ite = ith->second.TrueSide.begin(),
                 iee = ith->second.TrueSide.end();
             ite != iee; ++ite) {
          os << "<" << (*ite)->FID << "," << (*ite)->RID << "> ";
        }
        os << std::endl;
        os << "False side: ";
        for (auto ite = ith->second.FalseSide.begin(),
                 iee = ith->second.FalseSide.end();
             ite != iee; ++ite) {
          os << "<" << (*ite)->FID << "," << (*ite)->RID << "> ";
        }
        os << std::endl;
      }
    }
  }
}
