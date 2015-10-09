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
#include "PBOProblem.h"
#include "instcov/DbgInfoMgr.h"
#include "MCDCAnalyzerSC.h"

namespace instcov {
struct PBOProblemOpt : public PBOProblem {
  PBOProblemOpt(void)
      : PBOProblem() {}
  virtual void emitConstrs(std::ostream &OS, const PBVarPrinter &VP) const;

  std::vector<PBConstr> TID2EV;
  std::vector<PBConstr> MaxConditionMatch;
  std::vector<PBConstr> ConditionMatch;
  std::vector<PBConstr> ConditionCanMatch;
  std::vector<PBConstr> EVMatch;
  std::vector<PBConstr> EVCanMatch;
  std::vector<PBConstr> CDValMatch;
  std::vector<PBConstr> CDValPair;
  std::vector<PBConstr> CDVal;
};

class PBOEmitter {
 public:
  typedef MCDCAnalyzerSC::EvalVec_t EvalVec_t;
  PBOEmitter(const MCDCAnalyzerSC &analyzer)
      : Analyzer(analyzer) {}

  PBOProblemOpt emitPBO(void);

  const std::map<PBVar, std::string> &getID2Str(void) const {
    return ID2Str;
  }

  void dumpPBVar2Str(std::ostream &OS) const;
  void dumpSID2LocInfo(std::ostream &OS, const DbgInfoMgr &DIM) const;

 private:
  PBVar encodeStr(const std::string &str);
  PBVar encodeTID(std::size_t TID);
  PBVar encodeConditionMatch(UUID_t UuidC);
  PBVar encodeConditionCanMatch(UUID_t UuidC);
  PBVar encodeEV(UUID_t UuidD, const EvalVec_t &EV);
  PBVar encodeEVMatch(
      UUID_t UuidD, UUID_t UuidC,
      const EvalVec_t &EV1, const EvalVec_t &EV2);
  PBVar encodeEVCanMatch(
      UUID_t UuidD, UUID_t UuidC,
      const EvalVec_t &EV1, const EvalVec_t &EV2);
  PBVar encodeCDValMatch(
      UUID_t UuidD, UUID_t Uuid,
      const EvalVec_t &EV1, const EvalVec_t &EV2);
  PBVar encodeCDValPair(
      UUID_t UuidD, UUID_t Uuid,
      const EvalVec_t &EV1, char Val1,
      const EvalVec_t &EV2, char Val2);
  PBVar encodeCDVal(
      UUID_t UuidD, UUID_t Uuid, const EvalVec_t &EV, char Val);
  std::size_t getSID(UUID_t Uuid);

  void pboEmitObj(PBOProblemOpt &Problem);
  void pboEmitTID2EV(PBOProblemOpt &Problem);
  void pboEmitConditionMatch(PBOProblemOpt &Problem);
  void pboEmitPerConditionMatch(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC);
  void pboEmitByEVPairs(PBOProblemOpt &Problem);
  void pboEmitPerEVMatch(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC,
      const EvalVec_t &EV1,
      const EvalVec_t &EV2);
  void pboEmitPerCDValMatchAndPairs(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t UuidC,
      const EvalVec_t &EV1,
      const EvalVec_t &EV2);
  void pboEmitCDVal(PBOProblemOpt &Problem);
  void pboEmitPerCDVal(
      PBOProblemOpt &Problem,
      UUID_t UuidD, UUID_t Uuid, const EvalVec_t &EV);

 private:
  std::set<std::size_t> TIDs;
  std::map<UUID_t, std::size_t> Uuid2SID;
  std::vector<UUID_t> SID2Uuid;
  llvm::StringMap<PBVar> IDPool;
  std::map<PBVar, std::string> ID2Str;
  const MCDCAnalyzerSC &Analyzer;
};
}

#endif  // INSTCOV_PBOEMITTER_H_
