//===-- ProblemGenerator.h ------- ProblemGenerator header ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the declaration for ProblemGenerator
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_PROBLEMGENERATOR_H_
#define INSTCOV_PROBLEMGENERATOR_H_

#include <vector>
#include <map>
#include <iostream>
#include "llvm/ADT/StringMap.h"
#include "instcov/LogMgr.h"
#include "instcov/PBOProblem.h"

namespace instcov {
struct PBOProblemNOpt : public PBOProblem {
  PBOProblemNOpt(void)
      : PBOProblem() {}
  
  virtual void emit(std::ostream &OS, const PBVarPrinter &VP) const;
  
  std::vector<PBConstr> ConditionMatch;
  std::vector<PBConstr> VisitMatch;
  std::vector<PBConstr> CDAssgnMatch;
  std::vector<PBConstr> AssgnPair;
  std::vector<PBConstr> Assgn;
};

class ProblemGenerator {
 public:
  ProblemGenerator(void);
  ~ProblemGenerator(void);

  void registerLogEntry(const LogEntry *E);
  PBOProblemNOpt emitPBO(void);

  void dumpPBVar2Str(std::ostream &OS) const;
  void dumpSID2LocInfo(std::ostream &OS, const LogMgr &LM) const;

  const std::map<PBVar, std::string> &getID2Str(void) const {
    return ID2Str;
  }

 private:
  PBVar encodeStr(const std::string &str);
  PBVar encodeConditionMatch(UUID_t UuidC);
  PBVar encodeVisitMatch(
      UUID_t UuidC,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2);
  PBVar encodeCDAssgnMatch(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2);
  PBVar encodeAssgnPair(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1, char Assgn1,
      std::size_t TID2, std::size_t VID2, char Assgn2);
  PBVar encodeAssgn(
      UUID_t Uuid,
      std::size_t TID, std::size_t VID, char Assgn);
  PBVar encodeT(std::size_t TID);
  PBVar getSID(UUID_t Uuid);
  void pboEmitObj(PBOProblemNOpt &Problem);
  void pboEmitAssgn(PBOProblemNOpt &Problem, const LogEntry *E);
  void pboEmitOneAssgn(
      PBOProblemNOpt &Problem,
      std::size_t TID, std::size_t VID,
      const std::pair<UUID_t, uint64_t> &Assgn);
  void pboEmitAssgnPair(
      PBOProblemNOpt &Problem,
      const LogEntry *E1, const LogEntry *E2);
  void pboEmitOneAssgnPair(
      PBOProblemNOpt &Problem, UUID_t Uuid,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2);
  void pboEmitPerDecision(
      PBOProblemNOpt &Problem, UUID_t UuidD);
  void pboEmitConditionMatch(
      PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC);
  void pboEmitVisitMatches(
      PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC);
  void pboEmitOneVisitMatch(
      PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC,
      const LogEntry *E1, const LogEntry *E2);
  void pboEmitPerVisit(PBOProblemNOpt &Problem);
  
 private:
  std::map<UUID_t, std::vector<UUID_t> > Children;
  std::map<UUID_t, std::vector<const LogEntry *> > Uuid2LogEntries;
  std::map<UUID_t, std::size_t> Uuid2SID;
  std::map<std::size_t, std::vector<std::size_t> > TID2VIDs;
  std::vector<UUID_t> SID2Uuid;
  llvm::StringMap<PBVar> IDPool;
  std::map<PBVar, std::string> ID2Str;
};
}

#endif  // INSTCOV_PROBLEMGENERATOR_H_
