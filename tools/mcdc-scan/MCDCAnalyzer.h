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
/// \brief This file contains the class for trace log manager
///
//===----------------------------------------------------------------------===//

#ifndef MCDCAnalyzer_H_
#define MCDCAnalyzer_H_

#include <vector>
#include <map>
#include <iostream>
#include <unordered_map>
#include "instcov/uuid.h"
#include "LogMgr.h"

namespace instcov {
class MCDCAnalyzer {
 public:
  typedef struct {
    std::vector<const LogEntry *> TrueSide;
    std::vector<const LogEntry *> FalseSide;
  } CData_entry_t;
  typedef std::unordered_map<size_t, CData_entry_t> CData_t;
  typedef std::map<UUID_t, CData_t> DData_t;
  typedef std::map<UUID_t, DData_t> Data_t;

  void registerEntry(const LogEntry *entry);

  const Data_t &getData(void) const { return Data; }

  void dump(std::ostream &OS) const;
  void dumpReport(std::ostream &OS, const LogMgr &LM) const;

 private:
  Data_t Data;
};
}

#endif  // MCDCAnalyzer_H_
