//===-- PBOEmitter.h -------- PBOEmitter class declaration ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the declaration for PBOEmitter
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_PBOEMITTER_H_
#define INSTCOV_PBOEMITTER_H_

#include "llvm/ADT/StringMap.h"
#include "instcov/PBOProblem.h"
#include "SCAnalyzer.h"

namespace instcov {
struct PBOProblemOpt : public PBOProblem {
  PBOProblemOpt(void)
      : PBOProblem() {}
  virtual void emit(std::ostream &OS, const PBVarPrinter &VP) const;

  std::vector<PBConstr> TID2Assgn;
  std::vector<PBConstr> ConditionMatch;
  std::vector<PBConstr> AssgnMatch;
  std::vector<PBConstr> CDAssgnMatch;
  std::vector<PBConstr> CDAssgnPair;
  std::vector<PBConstr> CDAssgn;
};

class PBOEmitter {
 public:
  typedef SCAnalyzer::Assignment_t Assignment_t;
  PBOEmitter(const SCAnalyzer &analyzer)
      : Analyzer(analyzer) {}

  PBOProblemOpt emitPBO(void);

 private:
  PBVar encodeStr(const std::string &str);
  PBVar encodeTID(std::size_t TID);
  PBVar encodeConditionMatch(UUID_t UuidC);
  PBVar encodeAssgn(UUID_t UuidD, const Assignment_t &Assgn);
  PBVar encodeAssgnMatch(
      UUID_t UuidD, UUID_t UuidC,
      const Assignment_t &Assgn1, const Assignment_t &Assgn2);
  PBVar encodeCDAssgnMatch(
      UUID_t UuidD, UUID_t Uuid,
      const Assignment_t &Assgn1, const Assignment_t &Assgn2);
  PBVar encodeCDAssgnPair(
      UUID_t UuidD, UUID_t Uuid,
      const Assignment_t &Assgn1, char Val1,
      const Assignment_t &Assgn2, char Val2);
  PBVar encodeCDAssgn(
      UUID_t UuidD, UUID_t Uuid, const Assignment_t &Assgn, char Val);
  std::size_t getSID(UUID_t Uuid);

  void pboEmitObj(PBOProblemOpt &Problem);
  void pboEmitTIDAssgn(PBOProblemOpt &Problem);
  void pboEmitConditionMatch(PBOProblemOpt &Problem);
  void pboEmitPerConditionMatch(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC);
  void pboEmitByAssgnPairs(PBOProblemOpt &Problem);
  void pboEmitPerAssgnMatch(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC,
      const Assignment_t &Assgn1,
      const Assignment_t &Assgn2);
  void pboEmitPerCDAssgnMatchAndPairs(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC,
      const Assignment_t &Assgn1,
      const Assignment_t &Assgn2);
  void pboEmitCDAssgn(PBOProblemOpt &Problem);
  void pboEmitPerCDAssgn(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t Uuid, const Assignment_t &Assgn);

 private:
  std::map<UUID_t, std::size_t> Uuid2SID;
  std::vector<UUID_t> SID2Uuid;
  llvm::StringMap<PBVar> IDPool;
  std::map<PBVar, std::string> ID2Str;
  const SCAnalyzer &Analyzer;  // for sorting the log entries
};
}

#endif  // INSTCOV_PBOEMITTER_H_
