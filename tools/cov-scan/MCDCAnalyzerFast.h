//===-- MCDCAnalyzerFast.h -- Fast MC/DC analyzer class ---------*- C++ -*-===//
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

#ifndef INSTCOV_MCDCANALYZERFAST_H_
#define INSTCOV_MCDCANALYZERFAST_H_

#include <vector>
#include <map>
#include <iostream>
#include <unordered_map>
#include "instcov/uuid.h"
#include "MCDCAnalyzer.h"

namespace instcov {
class MCDCAnalyzerFast : public MCDCAnalyzer {
 public:
  MCDCAnalyzerFast(const DbgInfoMgr &dim)
      : MCDCAnalyzer(AK_Fast, dim) {}

  static bool classof(const MCDCAnalyzer *A) {
    return A->getKind() == AK_Fast;
  }

 public:
  typedef struct {
    std::vector<const DCRecord *> TrueSide;
    std::vector<const DCRecord *> FalseSide;
  } CData_entry_t;
  typedef std::unordered_map<size_t, CData_entry_t> CData_t;
  typedef std::map<UUID_t, CData_t> DData_t;
  typedef std::map<UUID_t, DData_t> Data_t;

  virtual void registerDCRecord(const DCRecord *DCR);
  virtual void finalize(void);

  const Data_t &getData(void) const { return Data; }

  static std::vector<Data_t::const_iterator>
  getSortedDecisions(
      const Data_t &Data, const DbgInfoMgr &DIM);

  static std::vector<DData_t::const_iterator>
  getSortedConditions(
      const DData_t &DData, const DbgInfoMgr &DIM);

  virtual void dump(std::ostream &OS) const;

 private:
  Data_t Data;
};

}

#endif  // INSTCOV_MCDCANALYZERFAST_H_
