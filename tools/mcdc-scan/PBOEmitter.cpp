//===-- PBOEmitter.cpp ----- class definition for PBOEmitter ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
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
  OS << "* TID2Assgn" << std::endl;
  instcov::emitConstrs(TID2Assgn, OS, VP);
  OS << "* MaxConditionMatch" << std::endl;
  instcov::emitConstrs(MaxConditionMatch, OS, VP);
  OS << "* ConditionMatch" << std::endl;
  instcov::emitConstrs(ConditionMatch, OS, VP);
  OS << "* ConditionCanMatch" << std::endl;
  instcov::emitConstrs(ConditionCanMatch, OS, VP);
  OS << "* AssgnMatch" << std::endl;
  instcov::emitConstrs(AssgnMatch, OS, VP);
  OS << "* AssgnCanMatch" << std::endl;
  instcov::emitConstrs(AssgnCanMatch, OS, VP);
  OS << "* CDAssgnMatch" << std::endl;
  instcov::emitConstrs(CDAssgnMatch, OS, VP);
  OS << "* CDAssgnPair" << std::endl;
  instcov::emitConstrs(CDAssgnPair, OS, VP);
  OS << "* CDAssgn" << std::endl;
  instcov::emitConstrs(CDAssgn, OS, VP);
}

PBOProblemOpt PBOEmitter::emitPBO(void) {
  PBOProblemOpt Problem;
  pboEmitTIDAssgn(Problem);
  pboEmitConditionMatch(Problem);
  pboEmitByAssgnPairs(Problem);
  pboEmitCDAssgn(Problem);
  // emit last
  pboEmitObj(Problem);

  Problem.NumVars = IDPool.size();
  Problem.NumConstrs = 0;
  Problem.NumConstrs += Problem.TID2Assgn.size();
  Problem.NumConstrs += Problem.MaxConditionMatch.size();
  Problem.NumConstrs += Problem.ConditionMatch.size();
  Problem.NumConstrs += Problem.ConditionCanMatch.size();
  Problem.NumConstrs += Problem.AssgnMatch.size();
  Problem.NumConstrs += Problem.AssgnCanMatch.size();
  Problem.NumConstrs += Problem.CDAssgnMatch.size();
  Problem.NumConstrs += Problem.CDAssgnPair.size();
  Problem.NumConstrs += Problem.CDAssgn.size();
  return Problem;
}

void PBOEmitter::pboEmitObj(PBOProblemOpt &Problem) {
  PBLinear ObjFunc;
  // for (auto &Dec_CondOrder : Analyzer.getDec2CondOrder()) {
  //   for (auto &UuidC : Dec_CondOrder.second) {
  //     PBVar Var = encodeConditionMatch(UuidC);
  //     ObjFunc.push_back(PBTerm(-1, SignedPBVar(Var, true)));
  //   }
  // }
  for (auto TID : TIDs) {
    PBVar Var = encodeTID(TID);
    ObjFunc.push_back(PBTerm(1, SignedPBVar(Var, true)));
  }
  Problem.ObjFunc = ObjFunc;
}

void PBOEmitter::pboEmitTIDAssgn(PBOProblemOpt &Problem) {
  for (auto &Dec_Assgn2Entries : Analyzer.getDec2Assgn2Entries()) {
    UUID_t UuidD = Dec_Assgn2Entries.first;
    for (auto &Assgn_Entries : Dec_Assgn2Entries.second) {
      auto &Assgn = Assgn_Entries.first;
      PBVar AssgnVar = encodeAssgn(UuidD, Assgn);
      SVarList SVars;
      for (auto &p_LE : Assgn_Entries.second) {
        std::size_t TID = p_LE->TID;
        PBVar TIDVar = encodeTID(TID);
        SVars.push_back(SignedPBVar(TIDVar, true));
      }
      genPBIdiomOr(SVars, SignedPBVar(AssgnVar, true),
                   Problem.TID2Assgn);
    }
  }
}

void PBOEmitter::pboEmitConditionMatch(PBOProblemOpt &Problem) {
  for (auto &Dec_AssgnEntries : Analyzer.getDec2Assgn2Entries()) {
    UUID_t UuidD = Dec_AssgnEntries.first;
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
  auto &Assgn2Entries =
      Analyzer.getDec2Assgn2Entries().find(UuidD)->second;
  SVarList SVars, SVarsCanMatch;
  for (auto it1 = Assgn2Entries.begin(), ie = Assgn2Entries.end();
       it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      SVars.push_back(SignedPBVar(
          encodeAssgnMatch(UuidD, UuidC, it1->first, it2->first), true));
      SVarsCanMatch.push_back(SignedPBVar(
          encodeAssgnCanMatch(UuidD, UuidC, it1->first, it2->first), true));
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

void PBOEmitter::pboEmitByAssgnPairs(PBOProblemOpt &Problem) {
  for (auto &Dec_Assgn2Entries : Analyzer.getDec2Assgn2Entries()) {
    UUID_t UuidD = Dec_Assgn2Entries.first;
    auto &Assgn2Entries = Dec_Assgn2Entries.second;
    auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
    for (auto it1 = Assgn2Entries.begin(), ie = Assgn2Entries.end();
         it1 != ie; ++it1) {
      auto it2 = it1;
      ++it2;
      for (; it2 != ie; ++it2) {
        for (auto &UuidC : Conditions) {
          pboEmitPerAssgnMatch(
              Problem, UuidD, UuidC, it1->first, it2->first);
          pboEmitPerCDAssgnMatchAndPairs(
              Problem, UuidD, UuidC, it1->first, it2->first);
        }
        pboEmitPerCDAssgnMatchAndPairs(
            Problem, UuidD, UuidD, it1->first, it2->first);
      }
    }
  }
}

void PBOEmitter::pboEmitPerAssgnMatch(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t UuidC,
    const Assignment_t &Assgn1,
    const Assignment_t &Assgn2) {
  const auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
  SVarList SVars, SVarsCanMatch;
  SVars.push_back(SignedPBVar(encodeAssgn(UuidD, Assgn1), true));
  SVars.push_back(SignedPBVar(encodeAssgn(UuidD, Assgn2), true));
  SVars.push_back(SignedPBVar(
      encodeCDAssgnMatch(UuidD, UuidD, Assgn1, Assgn2), false));
  SVarsCanMatch.push_back(SignedPBVar(
      encodeCDAssgnMatch(UuidD, UuidD, Assgn1, Assgn2), false));
  for (auto &Cond : Conditions) {
    PBVar Var = encodeCDAssgnMatch(UuidD, Cond, Assgn1, Assgn2);
    SVars.push_back(SignedPBVar(Var, Cond != UuidC));
    SVarsCanMatch.push_back(SignedPBVar(Var, Cond != UuidC));
  }
  PBVar VarAssgnMatch = encodeAssgnMatch(
      UuidD, UuidC, Assgn1, Assgn2);
  PBVar VarAssgnCanMatch = encodeAssgnCanMatch(
      UuidD, UuidC, Assgn1, Assgn2);
  genPBIdiomAnd(SVars, SignedPBVar(VarAssgnMatch, true), Problem.AssgnMatch);
  genPBIdiomAnd(SVarsCanMatch, SignedPBVar(VarAssgnCanMatch, true),
                Problem.AssgnCanMatch);
}

void PBOEmitter::pboEmitPerCDAssgnMatchAndPairs(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t Uuid,
    const Assignment_t &Assgn1,
    const Assignment_t &Assgn2) {
  PBVar VarTF = encodeCDAssgnPair(UuidD, Uuid, Assgn1, 'T', Assgn2, 'F');
  PBVar VarFT = encodeCDAssgnPair(UuidD, Uuid, Assgn1, 'F', Assgn2, 'T');
  PBVar VarT1 = encodeCDAssgn(UuidD, Uuid, Assgn1, 'T');
  PBVar VarF1 = encodeCDAssgn(UuidD, Uuid, Assgn1, 'F');
  PBVar VarT2 = encodeCDAssgn(UuidD, Uuid, Assgn2, 'T');
  PBVar VarF2 = encodeCDAssgn(UuidD, Uuid, Assgn2, 'F');
  PBVar VarMatch = encodeCDAssgnMatch(UuidD, Uuid, Assgn1, Assgn2);

  genPBIdiomAnd(SignedPBVar(VarT1, true),
                SignedPBVar(VarF2, true),
                SignedPBVar(VarTF, true),
                Problem.CDAssgnPair);
  genPBIdiomAnd(SignedPBVar(VarF1, true),
                SignedPBVar(VarT2, true),
                SignedPBVar(VarFT, true),
                Problem.CDAssgnPair);
  genPBIdiomOr(SignedPBVar(VarTF, true),
               SignedPBVar(VarFT, true),
               SignedPBVar(VarMatch, false),
               Problem.CDAssgnMatch);
}

void PBOEmitter::pboEmitCDAssgn(PBOProblemOpt &Problem) {
  for (auto &Dec_Assgn2Entries : Analyzer.getDec2Assgn2Entries()) {
    UUID_t UuidD = Dec_Assgn2Entries.first;
    auto &Conditions = Analyzer.getDec2CondOrder().find(UuidD)->second;
    for (auto &Assgn_Entries : Dec_Assgn2Entries.second) {
      for (auto &UuidC : Conditions) {
        pboEmitPerCDAssgn(Problem, UuidD, UuidC, Assgn_Entries.first);
      }
      pboEmitPerCDAssgn(Problem, UuidD, UuidD, Assgn_Entries.first);
    }
  }
}

void PBOEmitter::pboEmitPerCDAssgn(
    PBOProblemOpt &Problem,
    UUID_t UuidD, UUID_t Uuid, const Assignment_t &Assgn) {
  PBVar VarTrue = encodeCDAssgn(UuidD, Uuid, Assgn, 'T');
  PBVar VarFalse = encodeCDAssgn(UuidD, Uuid, Assgn, 'F');
  std::size_t Pos = Analyzer.getUuid2AssgnPos().find(Uuid)->second;
  char Val = Assgn[Pos];
  Problem.CDAssgn.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarTrue, true))),
      Val == 'T', true));
  Problem.CDAssgn.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarFalse, true))),
      Val == 'F', true));
}

PBVar PBOEmitter::encodeStr(const std::string &str) {
  if (!IDPool.count(str)) {
    IDPool[str] = IDPool.size()+1;
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

PBVar PBOEmitter::encodeAssgn(UUID_t UuidD, const Assignment_t &Assgn) {
  std::stringstream ss;
  ss << "a_" << getSID(UuidD) << "_" << Assgn;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeAssgnMatch(
    UUID_t UuidD, UUID_t UuidC,
    const Assignment_t &Assgn1, const Assignment_t &Assgn2) {
  std::stringstream ss;
  ss << "am_" << getSID(UuidD) << "_" << getSID(UuidC)
     << "_" << Assgn1 << "_" << Assgn2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeAssgnCanMatch(
    UUID_t UuidD, UUID_t UuidC,
    const Assignment_t &Assgn1, const Assignment_t &Assgn2) {
  std::stringstream ss;
  ss << "acm_" << getSID(UuidD) << "_" << getSID(UuidC)
     << "_" << Assgn1 << "_" << Assgn2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDAssgnMatch(
    UUID_t UuidD, UUID_t Uuid,
    const Assignment_t &Assgn1, const Assignment_t &Assgn2) {
  std::stringstream ss;
  ss << "cdm_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << Assgn1 << "_" << Assgn2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDAssgnPair(
    UUID_t UuidD, UUID_t Uuid,
    const Assignment_t &Assgn1, char Val1,
    const Assignment_t &Assgn2, char Val2) {
  std::stringstream ss;
  ss << "cdap_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << Assgn1 << "_" << Val1
     << "_" << Assgn2 << "_" << Val2;
  return encodeStr(ss.str());
}

PBVar PBOEmitter::encodeCDAssgn(
    UUID_t UuidD, UUID_t Uuid, const Assignment_t &Assgn, char Val) {
  std::stringstream ss;
  ss << "cda_" << getSID(UuidD) << "_" << getSID(Uuid)
     << "_" << Assgn << "_" << Val;
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
                                 const LogMgr &LM) const {
  OS << "* LocInfo" << std::endl;
  auto dorder = getSortedIterators(Analyzer.getDec2CondOrder(), LM);
  for (auto it_Dec_CondOrder : dorder) {
    UUID_t UuidD = it_Dec_CondOrder->first;
    const LocInfo &LocD = LM.getLocInfo(UuidD);
    std::size_t SIDD = Uuid2SID.find(UuidD)->second;
    OS << "* SID=" << SIDD
       << ": UUID=" << UuidD.toString() << ", Parent=" << UUID_t().toString()
       << ", File=" << LocD.File << ", Line=" << LocD.Line
       << ", Col=" << LocD.Col << std::endl;
    for (auto UuidC : it_Dec_CondOrder->second) {
      const LocInfo &LocC = LM.getLocInfo(UuidC);
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
