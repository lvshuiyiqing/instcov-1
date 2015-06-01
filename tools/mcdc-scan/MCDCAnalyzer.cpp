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
#include "llvm/Support/CommandLine.h"

using namespace llvm;
cl::opt<bool> CountsOnly("counts-only",
                         cl::desc("only counts"),
                         cl::init(false));

using namespace instcov;

void MCDCAnalyzer::registerEntry(const LogEntry *entry) {
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

void MCDCAnalyzer::dumpReport(std::ostream &OS) const {
  // decision level
  for (auto itd = Data.begin(), ied = Data.end(); itd != ied; ++itd) {
    OS << "Decision: " << itd->first.toString() << ":" << std::endl;
    // condition level
    for (auto itc = itd->second.begin(), iec = itd->second.end();
         itc != iec; ++itc) {
      OS << "Condition: " << itc->first.toString();
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
        OS << " > Covered" << std::endl;
      } else {
        OS << " > Uncovered" << std::endl;
      }
    }
  }
}

void MCDCAnalyzer::dump(std::ostream &OS) const {
  // decision level
  for (auto itd = Data.begin(), ied = Data.end(); itd != ied; ++itd) {
    OS << "Decision: " << itd->first.toString() << ":" << std::endl;
    // condition level
    for (auto itc = itd->second.begin(), iec = itd->second.end();
         itc != iec; ++itc) {
      OS << "Condition: " << itc->first.toString() << std::endl;
      // hash level
      for (auto ith = itc->second.begin(), ieh = itc->second.end();
           ith != ieh; ++ith) {
        if (!ith->second.TrueSide.empty() && !ith->second.FalseSide.empty()) {
          OS << "Hash (Covered): ";
        } else {
          OS << "Hash (Uncovered): ";
        }
        OS << ith->first << std::endl;
        OS << "True side: " << ith->second.TrueSide.size();
        if (!CountsOnly) {
          for (auto ite = ith->second.TrueSide.begin(),
                   iee = ith->second.TrueSide.end();
               ite != iee; ++ite) {
            OS << "<" << (*ite)->FID << "," << (*ite)->RID << "> ";
          }
        }
        OS << std::endl;
        OS << "False side: " << ith->second.FalseSide.size();
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
