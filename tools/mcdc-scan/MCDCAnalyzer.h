//===-- MCDCAnalyzer.h ------- MC/DC analyzer class -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the abstract class for MCDC analyzers
///
//===----------------------------------------------------------------------===//

#ifndef MCDCAnalyzer_H_
#define MCDCAnalyzer_H_

#include "LogMgr.h"

namespace instcov {
class MCDCAnalyzer {
 public:
  virtual void registerEntry(const LogEntry *entry, const LogMgr &LM) = 0;
  virtual void dump(std::ostream &OS, const LogMgr &LM) const = 0;
  virtual void finalize(void) = 0;

 public:
  static std::string getLocString(const LogMgr &LM, UUID_t Uuid) {
    if (LM.getLocInfos().count(Uuid)) {
      return LM.getLocInfos().find(Uuid)->second.toString();
    }
    return "NA";
  }

  struct LocSorter {
   public:
    LocSorter(const LogMgr &lm)
        : LM(lm) {}
    
    template<typename T>
    bool operator()(const T &LHS, const T &RHS) const {
      if (LM.getLocInfos().count(LHS->first) == 0) {
        return true;
      }
      if (LM.getLocInfos().count(RHS->first) == 0) {
        return false;
      }
      const LocInfo &LHS_LI = LM.getLocInfos().find(LHS->first)->second;
      const LocInfo &RHS_LI = LM.getLocInfos().find(RHS->first)->second;
      return std::make_tuple(LHS_LI.FileName, LHS_LI.Line, LHS_LI.Col) <
      std::make_tuple(RHS_LI.FileName, RHS_LI.Line, RHS_LI.Col);
    }
 
   private:
    const LogMgr &LM;
  };
  
  template<typename T>
  static std::vector<typename T::const_iterator>
  getSortedIterators(const T &C, const LogMgr &LM) {
    std::vector<typename T::const_iterator> vec;
    for (auto it = C.begin(), ie = C.end(); it != ie; ++it) {
      vec.push_back(it);
    }
    std::sort(vec.begin(), vec.end(), LocSorter(LM));
    return vec;
  }

};
}

#endif  // MCDCAnalyzer_H_
