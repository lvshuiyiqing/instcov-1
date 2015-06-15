//===-- FastAnalyzer.h -- Fast MC/DC analyzer class -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for fast MC/DC analyzer
///
//===----------------------------------------------------------------------===//

#ifndef FastAnalyzer_H_
#define FastAnalyzer_H_

#include <vector>
#include <map>
#include <iostream>
#include <unordered_map>
#include "instcov/uuid.h"
#include "MCDCAnalyzer.h"

namespace instcov {
class FastAnalyzer : public MCDCAnalyzer {
 public:
  typedef struct {
    std::vector<const LogEntry *> TrueSide;
    std::vector<const LogEntry *> FalseSide;
  } CData_entry_t;
  typedef std::unordered_map<size_t, CData_entry_t> CData_t;
  typedef std::map<UUID_t, CData_t> DData_t;
  typedef std::map<UUID_t, DData_t> Data_t;

  virtual void registerEntry(const LogEntry *entry, const LogMgr &LM);
  virtual void finalize(void);
  
  const Data_t &getData(void) const { return Data; }

  static std::vector<Data_t::const_iterator>
  getSortedDecisions(
      const Data_t &Data, const LogMgr &LM);

  static std::vector<DData_t::const_iterator>
  getSortedConditions(
      const DData_t &DData, const LogMgr &LM);

  virtual void dump(std::ostream &OS, const LogMgr &LM) const;

 private:
  Data_t Data;
};

}

#endif  // FastAnalyzer_H_
