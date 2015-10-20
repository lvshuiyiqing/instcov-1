//===-- PBOEmitter.cpp ----- class definition for PBOEmitter ----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the definitions for PBOEmitter
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include <algorithm>
#include <functional>
#include "llvm/Support/CommandLine.h"
#include "PBOEmitter.h"

using namespace llvm;
using namespace instcov;

void PBOProblemOpt::emitConstrs(
    std::ostream &OS, const PBVarPrinter &VP) const {
  PBOProblem::emitConstrs(OS, VP);
  OS << "* TID2EV" << std::endl;
  instcov::emitConstrs(TID2EV, OS, VP);
  OS << "* MaxConditionMatch (condition can match"
      " -> condition must match)" << std::endl;
  instcov::emitConstrs(MaxConditionMatch, OS, VP);
  OS << "* ConditionMatch (by selected test cases)" << std::endl;
  instcov::emitConstrs(ConditionMatch, OS, VP);
  OS << "* ConditionCanMatch (whether match is possible)" << std::endl;
  instcov::emitConstrs(ConditionCanMatch, OS, VP);
  OS << "* EVMatch (two evaluation vectors is a MC/DC pair on"
      " specific condition and are covered by selected test cases)"
     << std::endl;
  instcov::emitConstrs(EVMatch, OS, VP);
  OS << "* EVCanMatch (two evaluation vectors is a MC/DC pair on"
      " specific condition) " << std::endl;
  instcov::emitConstrs(EVCanMatch, OS, VP);
  OS << "* CDValMatch (whether the value of a decision/condition is the same"
      " for two evaluation vectors. Only TT/FF/*X/X*/XX are considered as"
      " matching pairs)"
     << std::endl;
  instcov::emitConstrs(CDValMatch, OS, VP);
  OS << "* CDValPair (auxiliary variable representing a decision/condition x"
      " takes the value of v1 in evaluation vector EV1, and takes the value"
      " of v2 in evaluation vector EV2)" << std::endl;
  instcov::emitConstrs(CDValPair, OS, VP);
  OS << "* CDVal (the values of decisions/conditions in evaluation vectors)"
     << std::endl;
  instcov::emitConstrs(CDVal, OS, VP);
}

PBOProblemOpt PBOEmitter::emitPBO(void) {
  PBOProblemOpt Problem;
  pboEmitTID2EV(Problem);
  pboEmitConditionMatch(Problem);
  pboEmitByEVPairs(Problem);
  pboEmitCDVal(Problem);
  // emit last, since the TID information need to be stored first,
  // which is done during the previous steps
  pboEmitObj(Problem);

  Problem.NumVars = IDPool.size();
  Problem.NumConstrs = 0;
  Problem.NumConstrs += Problem.TID2EV.size();
  Problem.NumConstrs += Problem.MaxConditionMatch.size();
  Problem.NumConstrs += Problem.ConditionMatch.size();
  Problem.NumConstrs += Problem.ConditionCanMatch.size();
  Problem.NumConstrs += Problem.EVMatch.size();
  Problem.NumConstrs += Problem.EVCanMatch.size();
  Problem.NumConstrs += Problem.CDValMatch.size();
  Problem.NumConstrs += Problem.CDValPair.size();
  Problem.NumConstrs += Problem.CDVal.size();
  return Problem;
}

void PBOEmitter::pboEmitObj(PBOProblemOpt &Problem) {
  PBLinear ObjFunc;
  for (auto TID : TIDs) {
    PBVar Var = encodeTID(TID);
    ObjFunc.push_back(PBTerm(1, SignedPBVar(Var, true)));
  }
  Problem.ObjFunc = ObjFunc;
}

void PBOEmitter::pboEmitTID2EV(PBOProblemOpt &Problem) {
  for (auto &Dec_EV2TIDs : Analyzer.getDec2EV2TIDs()) {
    UUID_t UuidD = Dec_EV2TIDs.first;
    for (auto &EV_TIDs : Dec_EV2TIDs.second) {
      auto &EV = EV_TIDs.first;
      PBVar EVVar = encodeEV(UuidD, EV);
      SVarList SVars;
      for (auto TID : EV_TIDs.second) {
        PBVar TIDVar = encodeTID(TID);
        SVars.push_back(SignedPBVar(TIDVar, true));
      }
      genPBIdiomOr(SVars, SignedPBVar(EVVar, true),
                   Problem.TID2EV);
    }
  }
}

void PBOEmitter::pboEmitConditionMatch(PBOProblemOpt &Problem) {
  for (auto &Dec_EV2TIDs : Analyzer.getDec2EV2TIDs()) {
    UUID_t UuidD = Dec_EV2TIDs.first;
    auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
    for (auto &UuidC : Conditions) {
      SVarList SVars;
      pboEmitPerConditionMatch(
          Problem, UuidD, UuidC);
    }
  }
}

void PBOEmitter::pboEmitPerConditionMatch(
    PBOProblemOpt &Problem, UUID_t UuidD, UUID_t UuidC) {
  auto &EV2TIDs =
      Analyzer.getDec2EV2TIDs().find(UuidD)->second;
  SVarList SVars, SVarsCanMatch;
  for (auto it1 = EV2TIDs.begin(), ie = EV2TIDs.end();
       it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      SVars.push_back(SignedPBVar(
          encodeEVMatch(UuidD, UuidC, it1->first, it2->first), true));
      SVarsCanMatch.push_back(SignedPBVar(
          encodeEVCanMatch(UuidD, UuidC, it1->first, it2->first), true));
    }
  }
  SignedPBVar SVarConditionMatch(encodeConditionMatch(UuidC), true);
  SignedPBVar SVarConditionCanMatch(encodeConditionCanMatch(UuidC), true);
  genPBIdiomOr(SVars, SVarConditionMatch,
               Problem.ConditionMatch);
  genPBIdiomOr(SVarsCanMatch, SVarConditionCanMatch,
               Problem.ConditionCanMatch);
  // for maximizing condition match
  PBConstr Constr;
  Constr.LHS.push_back(PBTerm(1, SVarConditionMatch));
  Constr.LHS.push_back(PBTerm(-1, SVarConditionCanMatch));
  Constr.RHS = 0;
  Constr.IsEqual = false;
  Problem.MaxConditionMatch.push_back(Constr);
}

void PBOEmitter::pboEmitByEVPairs(PBOProblemOpt &Problem) {
  for (auto &Dec_EV2TIDs : Analyzer.getDec2EV2TIDs()) {
    UUID_t UuidD = Dec_EV2TIDs.first;
    auto &EV2TIDs = Dec_EV2TIDs.second;
    auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
    for (auto it1 = EV2TIDs.begin(), ie = EV2TIDs.end();
         it1 != ie; ++it1) {
      auto it2 = it1;
      ++it2;
      for (; it2 != ie; ++it2) {
        for (auto &UuidC : Conditions) {
          pboEmitPerEVMatch(
              Problem, UuidD, UuidC, it1->first, it2->first);
          pboEmitPerCDValMatchAndPairs(
              Problem, UuidD, UuidC, it1->first, it2->first);
        }
        pboEmitPerCDValMatchAndPairs(
            Problem, UuidD, UuidD, it1->first, it2->first);
      }
    }
  }
}

void PBOEmitter::pboEmitPerEVMatch(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t UuidC,
    const EvalVec_t &EV1,
    const EvalVec_t &EV2) {
  const auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
  SVarList SVars, SVarsCanMatch;
  SVars.push_back(SignedPBVar(encodeEV(UuidD, EV1), true));
  SVars.push_back(SignedPBVar(encodeEV(UuidD, EV2), true));
  SVars.push_back(SignedPBVar(
      encodeCDValMatch(UuidD, UuidD, EV1, EV2), false));
  SVarsCanMatch.push_back(SignedPBVar(
      encodeCDValMatch(UuidD, UuidD, EV1, EV2), false));
  for (auto &Cond : Conditions) {
    PBVar Var = encodeCDValMatch(UuidD, Cond, EV1, EV2);
    SVars.push_back(SignedPBVar(Var, Cond != UuidC));
    SVarsCanMatch.push_back(SignedPBVar(Var, Cond != UuidC));
  }
  PBVar VarEVMatch = encodeEVMatch(
      UuidD, UuidC, EV1, EV2);
  PBVar VarEVCanMatch = encodeEVCanMatch(
      UuidD, UuidC, EV1, EV2);
  genPBIdiomAnd(SVars, SignedPBVar(VarEVMatch, true), Problem.EVMatch);
  genPBIdiomAnd(SVarsCanMatch, SignedPBVar(VarEVCanMatch, true),
                Problem.EVCanMatch);
}

void PBOEmitter::pboEmitPerCDValMatchAndPairs(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t Uuid,
    const EvalVec_t &EV1,
    const EvalVec_t &EV2) {
  PBVar VarTF = encodeCDValPair(UuidD, Uuid, EV1, 'T', EV2, 'F');
  PBVar VarFT = encodeCDValPair(UuidD, Uuid, EV1, 'F', EV2, 'T');
  PBVar VarT1 = encodeCDVal(UuidD, Uuid, EV1, 'T');
  PBVar VarF1 = encodeCDVal(UuidD, Uuid, EV1, 'F');
  PBVar VarT2 = encodeCDVal(UuidD, Uuid, EV2, 'T');
  PBVar VarF2 = encodeCDVal(UuidD, Uuid, EV2, 'F');
  PBVar VarMatch = encodeCDValMatch(UuidD, Uuid, EV1, EV2);

  genPBIdiomAnd(SignedPBVar(VarT1, true),
                SignedPBVar(VarF2, true),
                SignedPBVar(VarTF, true),
                Problem.CDValPair);
  genPBIdiomAnd(SignedPBVar(VarF1, true),
                SignedPBVar(VarT2, true),
                SignedPBVar(VarFT, true),
                Problem.CDValPair);
  genPBIdiomOr(SignedPBVar(VarTF, true),
               SignedPBVar(VarFT, true),
               SignedPBVar(VarMatch, false),
               Problem.CDValMatch);
}

void PBOEmitter::pboEmitCDVal(PBOProblemOpt &Problem) {
  for (auto &Dec_EV2TIDs : Analyzer.getDec2EV2TIDs()) {
    UUID_t UuidD = Dec_EV2TIDs.first;
    auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
    for (auto &EV_TIDs : Dec_EV2TIDs.second) {
      for (auto &UuidC : Conditions) {
        pboEmitPerCDVal(Problem, UuidD, UuidC, EV_TIDs.first);
      }
      pboEmitPerCDVal(Problem, UuidD, UuidD, EV_TIDs.first);
    }
  }
}

void PBOEmitter::pboEmitPerCDVal(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t Uuid, const EvalVec_t &EV) {
  PBVar VarTrue = encodeCDVal(UuidD, Uuid, EV, 'T');
  PBVar VarFalse = encodeCDVal(UuidD, Uuid, EV, 'F');
  std::size_t Pos = Analyzer.getUuid2EVPos().find(Uuid)->second;
  char Val = EV[Pos];
  Problem.CDVal.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarTrue, true))),
      Val == 'T', true));
  Problem.CDVal.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarFalse, true))),
      Val == 'F', true));
}

PBVar PBOEmitter::encodeStr(const std::string &str) {
  if (!IDPool.count(str)) {
    std::size_t NewID = IDPool.size() + 1;
    IDPool[str] = NewID;
    ID2Str[IDPool.size()] = str;
  }
  return IDPool[str];
}

PBVar PBOEmitter::encodeTID(std::size_t TID) {
  TIDs.insert(TID);
  std::stringstream ss;
  ss << "t_" << TID;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeConditionMatch(UUID_t UuidC) {
  std::stringstream ss;
  ss << "cm_" << getSID(UuidC);
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeConditionCanMatch(UUID_t UuidC) {
  std::stringstream ss;
  ss << "ccm_" << getSID(UuidC);
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeEV(UUID_t UuidD, const EvalVec_t &EV) {
  std::stringstream ss;
  ss << "a_" << getSID(UuidD) << "_" << EV;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeEVMatch(
    UUID_t UuidD, UUID_t UuidC,
    const EvalVec_t &EV1, const EvalVec_t &EV2) {
  std::stringstream ss;
  ss << "am_" << getSID(UuidD) << "_" << getSID(UuidC)
     << "_" << EV1 << "_" << EV2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeEVCanMatch(
    UUID_t UuidD, UUID_t UuidC,
    const EvalVec_t &EV1, const EvalVec_t &EV2) {
  std::stringstream ss;
  ss << "acm_" << getSID(UuidD) << "_" << getSID(UuidC)
     << "_" << EV1 << "_" << EV2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDValMatch(
    UUID_t UuidD, UUID_t Uuid,
    const EvalVec_t &EV1, const EvalVec_t &EV2) {
  std::stringstream ss;
  ss << "cdm_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << EV1 << "_" << EV2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDValPair(
    UUID_t UuidD, UUID_t Uuid,
    const EvalVec_t &EV1, char Val1,
    const EvalVec_t &EV2, char Val2) {
  std::stringstream ss;
  ss << "cdap_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << EV1 << "_" << Val1
     << "_" << EV2 << "_" << Val2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDVal(
    UUID_t UuidD, UUID_t Uuid, const EvalVec_t &EV, char Val) {
  std::stringstream ss;
  ss << "cda_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << EV << "_" << Val;
  return encodeStr(ss.str());
}

std::size_t PBOEmitter::getSID(UUID_t Uuid) {
  auto it = Uuid2SID.find(Uuid);
  if (it != Uuid2SID.end()) {
    return it->second;
  }
  Uuid2SID[Uuid] = Uuid2SID.size();
  SID2Uuid.push_back(Uuid);
  return Uuid2SID[Uuid];
}


void PBOEmitter::dumpPBVar2Str(std::ostream &OS) const {
  OS << "* PB variable info" << std::endl;
  for (auto ID_Str : ID2Str) {
    OS << "* x" << ID_Str.first << ": " << ID_Str.second << std::endl;
  }
}

void PBOEmitter::dumpSID2LocInfo(std::ostream &OS,
                                 const DbgInfoMgr &DIM) const {
  OS << "* LocInfo" << std::endl;
  auto dorder = getSortedIterators(Analyzer.getDec2CondOrder(), DIM);
  for (auto it_Dec_CondOrder : dorder) {
    UUID_t UuidD = it_Dec_CondOrder->first;
    const LocInfo &LocD = DIM.getDbgInfo(UuidD)->Loc;
    std::size_t SIDD = Uuid2SID.find(UuidD)->second;
    OS << "* SID=" << SIDD
       << ": UUID=" << UuidD.toString() << ", Parent=" << UUID_t().toString()
       << ", File=" << LocD.File << ", Line=" << LocD.Line
       << ", Col=" << LocD.Col << std::endl;
    for (auto UuidC : it_Dec_CondOrder->second) {
      const LocInfo &LocC = DIM.getDbgInfo(UuidC)->Loc;
      std::size_t SIDC = Uuid2SID.find(UuidC)->second;
      OS << "* SID=" << SIDC
         << ": UUID=" << UuidC.toString() << ", Parent=" << UuidD.toString()
         << ", File=" << LocC.File << ", Line=" << LocC.Line
         << ", Col=" << LocC.Col << std::endl;
    }
  }
  // std::vector<std::size_t> SIDs;
  // for (std::size_t i = 0; i < SID2Uuid.size(); ++i) {
  //   SIDs.push_back(i);
  // }

  // struct SIDSorter {
  //   SIDSorter(const LogMgr &lm, const std::vector<UUID_t> &sid2uuid)
  //       : LM(lm), SID2Uuid(sid2uuid) {}

  //   bool operator()(std::size_t LHS, std::size_t RHS) const {
  //     const LocInfo &LHSLoc = LM.getLocInfo(SID2Uuid[LHS]);
  //     const LocInfo &RHSLoc = LM.getLocInfo(SID2Uuid[RHS]);
  //     return std::make_tuple(LHSLoc.File, LHSLoc.Line, LHSLoc.Col) <
  //       std::make_tuple(RHSLoc.File, RHSLoc.Line, RHSLoc.Col);
  //   }
  //   const LogMgr &LM;
  //   const std::vector<UUID_t> &SID2Uuid;
  // };

  // OS << "* LocInfo" << std::endl;
  // // std::sort(SIDs.begin(), SIDs.end(), SIDSorter(LM, SID2Uuid));
  // for (auto SID : SIDs) {
  //   UUID_t Uuid = SID2Uuid[SID];
  //   const LocInfo &Loc = LM.getLocInfo(Uuid);
  //   OS << "* SID=" << SID << ": UUID=" << Uuid.toString() << ", File="
  //      << Loc.File << ", Line=" << Loc.Line << ", Col=" << Loc.Col << std::endl;
  // }
}
