//===-- ProblemGenerator.cpp ---- ProblemGenerator definition ---*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This is the definitions for ProblemGenerator
///
//===----------------------------------------------------------------------===//

#include <sstream>
#include <algorithm>
#include <functional>
#include "llvm/Support/CommandLine.h"
#include "ProblemGenerator.h"

using namespace llvm;
using namespace instcov;

void SignedPBVar::emit(std::ostream &OS,
                       const PBVarPrinter &VP) const {
  OS << (getSign() ? "" : "~") << VP(getPBVar());
}

void PBTerm::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  OS << (getWeight() > 0 ? "+" : "") << getWeight();
  getSVar().emit(OS, VP);
}

void PBLinear::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  bool IsFirst = true;
  for (auto &&Term : (*this)) {
    if (IsFirst) {
      IsFirst = false;
    } else {
      OS << " ";      
    }
    Term.emit(OS, VP);
  }
}

void PBConstr::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  if (LHS.empty()) {
    std::cerr << "LHS is empty, why?" << std::endl;
    exit(1);
  }
  LHS.emit(OS, VP);
  OS << " " << (IsEqual ? "=" : ">=") << " ";
  if (RHS > 0) {
    OS << "+";
  }
  OS << RHS << ";" << std::endl;
}

void PBOProblemNOpt::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  OS << "* #variable= " << NumVars << " #constraint= " << NumConstrs;
  OS << std::endl;
  if (!ObjFunc.empty()) {
    OS << "min: ";
    ObjFunc.emit(OS, VP);
    OS << ";" << std::endl;
  } else {
    OS << "* no objective function" << std::endl;
  }
  OS << "* ConditionMatch" << std::endl;
  emitConstrs(ConditionMatch, OS, VP);
  OS << "* VisitMatch" << std::endl;
  emitConstrs(VisitMatch, OS, VP);
  OS << "* CDAssgnMatch" << std::endl;
  emitConstrs(CDAssgnMatch, OS, VP);
  OS << "* AssgnPair" << std::endl;
  emitConstrs(AssgnPair, OS, VP);
  OS << "* Assgn" << std::endl;
  emitConstrs(Assgn, OS, VP);
}

ProblemGenerator::ProblemGenerator(void) {
}

ProblemGenerator::~ProblemGenerator(void) {
}

void ProblemGenerator::registerLogEntry(const LogEntry *E) {
  Uuid2LogEntries[E->Decision.first].push_back(E);
  TID2VIDs[E->TID].push_back(E->VID);
  if (!Children.count(E->Decision.first)) {
    Children[E->Decision.first];
    for (auto &&Cond_Assgn : E->Conditions) {
      Children[E->Decision.first].push_back(Cond_Assgn.first);
    }
  }
}

PBVar ProblemGenerator::encodeStr(const std::string &str) {
  if (!IDPool.count(str)) {
    IDPool[str] = IDPool.size()+1;
    ID2Str[IDPool.size()] = str;
  }
  return IDPool[str];
}

PBVar ProblemGenerator::encodeConditionMatch(UUID_t UuidC) {
  std::stringstream ss;
  ss << "cm_" << getSID(UuidC);
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeVisitMatch(
      UUID_t UuidC,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2) {
  std::stringstream ss;
  ss << "vm_" << getSID(UuidC)
     << "_" << TID1 << "_" << VID1
     << "_" << TID2 << "_" << VID2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeCDAssgnMatch(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2) {
  std::stringstream ss;
  ss << "cdm_" << getSID(Uuid)
     << "_" << TID1 << "_" << VID1
     << "_" << TID2 << "_" << VID2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeAssgnPair(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1, char Assgn1,
      std::size_t TID2, std::size_t VID2, char Assgn2) {
  std::stringstream ss;
  ss << "ap_" << getSID(Uuid)
     << "_" << TID1 << "_" << VID1 << "_" << Assgn1
     << "_" << TID2 << "_" << VID2 << "_" << Assgn2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeAssgn(
      UUID_t Uuid,
      std::size_t TID, std::size_t VID, char Assgn) {
  std::stringstream ss;
  ss << "a_" << getSID(Uuid)
     << "_" << TID << "_" << VID << "_" << Assgn;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeT(std::size_t TID) {
  std::stringstream ss;
  ss << "t_" << TID;
  return encodeStr(ss.str());
}

std::size_t ProblemGenerator::getSID(UUID_t Uuid) {
  auto it = Uuid2SID.find(Uuid);
  if (it != Uuid2SID.end()) {
    return it->second;
  }
  Uuid2SID[Uuid] = Uuid2SID.size();
  SID2Uuid.push_back(Uuid);
  return Uuid2SID[Uuid];
}

PBOProblemNOpt ProblemGenerator::emitPBO(void) {
  PBOProblemNOpt Problem;
  pboEmitObj(Problem);
  for (auto &&Uuid_LogEntries : Uuid2LogEntries) {
    for (auto &&Entry : Uuid_LogEntries.second) {
      pboEmitAssgn(Problem, Entry);
    }
  }
  for (auto &&Uuid_LogEntries : Uuid2LogEntries) {
    pboEmitPerDecision(Problem, Uuid_LogEntries.first);
  }
  Problem.NumVars = IDPool.size();
  Problem.NumConstrs = 0;
  Problem.NumConstrs += Problem.ConditionMatch.size();
  Problem.NumConstrs += Problem.VisitMatch.size();
  Problem.NumConstrs += Problem.CDAssgnMatch.size();
  Problem.NumConstrs += Problem.AssgnPair.size();
  Problem.NumConstrs += Problem.Assgn.size();
  return Problem;
}

void ProblemGenerator::pboEmitObj(PBOProblemNOpt &Problem) {
  PBLinear ObjFunc;
  for (auto &&Uuid_Children : Children) {
    for (auto &&Uuid : Uuid_Children.second) {
      PBVar Var = encodeConditionMatch(Uuid);
      ObjFunc.push_back(PBTerm(-1, SignedPBVar(Var, true)));
    }
  }
  Problem.ObjFunc = ObjFunc;
}

void ProblemGenerator::pboEmitAssgn(PBOProblemNOpt &Problem, const LogEntry *E) {
  pboEmitOneAssgn(Problem, E->TID, E->VID, E->Decision);
  for (auto Cond_Assgn : E->Conditions) {
    pboEmitOneAssgn(Problem, E->TID, E->VID, Cond_Assgn);
  }
}

void ProblemGenerator::pboEmitOneAssgn(
    PBOProblemNOpt &Problem,
    std::size_t TID, std::size_t VID,
    const std::pair<UUID_t, uint64_t> &Assgn) {
  PBVar VarTrue = encodeAssgn(Assgn.first, TID, VID, 'T');
  PBVar VarFalse = encodeAssgn(Assgn.first, TID, VID, 'F');
  Problem.Assgn.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarTrue, true))),
      Assgn.second == 1, true));
  Problem.Assgn.push_back(PBConstr(
      PBLinear(1, PBTerm(
          1, SignedPBVar(VarFalse, true))),
      Assgn.second == 0, true));
}

void ProblemGenerator::pboEmitPerDecision(
    PBOProblemNOpt &Problem, UUID_t UuidD) {
  // emit the assignment pairs first
  const auto &Entries = Uuid2LogEntries[UuidD];
  for (auto it1 = Entries.begin(), ie = Entries.end(); it1 != ie; ++it1) {    
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      pboEmitAssgnPair(Problem, *it1, *it2);
    }
  }
  // TODO: emit visit & condition matches
  const auto &Conditions = Children[UuidD];
  for (auto Condition : Conditions) {
    pboEmitVisitMatches(Problem, UuidD, Condition);
    pboEmitConditionMatch(Problem, UuidD, Condition);
  }
}

void ProblemGenerator::pboEmitAssgnPair(
    PBOProblemNOpt &Problem, const LogEntry *E1, const LogEntry *E2) {
  UUID_t UuidD = E1->Decision.first;
  pboEmitOneAssgnPair(
      Problem, UuidD,
      E1->TID, E1->VID, E2->TID, E2->VID);
  for (auto Child : Children[UuidD]) {
    pboEmitOneAssgnPair(Problem, Child, E1->TID, E1->VID, E2->TID, E2->VID);
  }
}

void ProblemGenerator::pboEmitOneAssgnPair(
    PBOProblemNOpt &Problem, UUID_t Uuid,
    std::size_t TID1, std::size_t VID1,
    std::size_t TID2, std::size_t VID2) {
  PBVar VarTF = encodeAssgnPair(Uuid, TID1, VID1, 'T', TID2, VID2, 'F');
  PBVar VarFT = encodeAssgnPair(Uuid, TID1, VID1, 'F', TID2, VID2, 'T');
  PBVar VarT1 = encodeAssgn(Uuid, TID1, VID1, 'T');
  PBVar VarF1 = encodeAssgn(Uuid, TID1, VID1, 'F');
  PBVar VarT2 = encodeAssgn(Uuid, TID2, VID2, 'T');
  PBVar VarF2 = encodeAssgn(Uuid, TID2, VID2, 'F');
  PBVar VarMatch = encodeCDAssgnMatch(Uuid, TID1, VID1, TID2, VID2);
  
  genPBIdiomAnd(SignedPBVar(VarT1, true),
                SignedPBVar(VarF2, true),
                SignedPBVar(VarTF, true),
                Problem.AssgnPair);
  genPBIdiomAnd(SignedPBVar(VarF1, true),
                SignedPBVar(VarT2, true),
                SignedPBVar(VarFT, true),
                Problem.AssgnPair);
  genPBIdiomOr(SignedPBVar(VarTF, true),
               SignedPBVar(VarFT, true),
               SignedPBVar(VarMatch, false),
               Problem.CDAssgnMatch);
}

void ProblemGenerator::pboEmitVisitMatches(
    PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC) {
  const auto &Entries = Uuid2LogEntries[UuidD];
  for (auto it1 = Entries.begin(), ie = Entries.end(); it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      pboEmitOneVisitMatch(Problem, UuidD, UuidC, *it1, *it2);
    }
  }
}

void ProblemGenerator::pboEmitOneVisitMatch(
    PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC,
    const LogEntry *E1, const LogEntry *E2) {
  const auto &Conditions = Children[UuidD];
  SVarList SVars;
  SVars.push_back(SignedPBVar(encodeT(E1->TID), true));
  SVars.push_back(SignedPBVar(encodeT(E2->TID), true));
  SVars.push_back(SignedPBVar(
      encodeCDAssgnMatch(UuidD, E1->TID, E1->VID, E2->TID, E2->VID), false));
  for (auto Condition : Conditions) {
    PBVar Var = encodeCDAssgnMatch(Condition, E1->TID, E1->VID, E2->TID, E2->VID);
    SVars.push_back(SignedPBVar(Var, Condition != UuidC));
  }
  PBVar VarVisitMatch = encodeVisitMatch(
      UuidC, E1->TID, E1->VID, E2->TID, E2->VID);
  genPBIdiomAnd(SVars, SignedPBVar(VarVisitMatch, true), Problem.VisitMatch);
}

void ProblemGenerator::pboEmitConditionMatch(
    PBOProblemNOpt &Problem, UUID_t UuidD, UUID_t UuidC) {
  SVarList SVars;
  const auto &Entries = Uuid2LogEntries[UuidD];
  for (auto it1 = Entries.begin(), ie = Entries.end(); it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      SVars.push_back(SignedPBVar(
          encodeVisitMatch(
              UuidC, (*it1)->TID, (*it1)->VID, (*it2)->TID, (*it2)->VID),
          true));
    }    
  }
  PBVar VarConditionMatch = encodeConditionMatch(UuidC);
  genPBIdiomOr(SVars, SignedPBVar(VarConditionMatch, true),
               Problem.ConditionMatch);
}

void instcov::genPBIdiomAnd(
    SignedPBVar SVar1, SignedPBVar SVar2, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  SVarList SVars;
  SVars.push_back(SVar1);
  SVars.push_back(SVar2);
  genPBIdiomAnd(SVars, SVarRes, Constrs);
}

void instcov::genPBIdiomAnd(
    const SVarList &SVars, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  PBConstr Constr;
  Constr.LHS.push_back(PBTerm(1, SVarRes));
  for (auto SVar : SVars) {
    Constr.LHS.push_back(PBTerm(-1, SVar));
  }
  Constr.RHS = 1 - SVars.size();
  Constr.IsEqual = false;
  Constrs.push_back(Constr);
  Constr.clear();
  for (auto SVar : SVars) {
    Constr.LHS.push_back(PBTerm(1, SVar));
    Constr.LHS.push_back(PBTerm(-1, SVarRes));
    Constr.RHS = 0;
    Constr.IsEqual = false;
    Constrs.push_back(Constr);
    Constr.clear();
  }
}

void instcov::genPBIdiomOr(
    SignedPBVar SVar1, SignedPBVar SVar2, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  SVarList SVars;
  SVars.push_back(SVar1);
  SVars.push_back(SVar2);
  genPBIdiomOr(SVars, SVarRes, Constrs);
}

void instcov::genPBIdiomOr(
    const SVarList &SVars, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  PBConstr Constr;
  Constr.LHS.push_back(PBTerm(-1, SVarRes));
  for (auto SVar : SVars) {
    Constr.LHS.push_back(PBTerm(1, SVar));
  }
  Constr.RHS = 0;
  Constr.IsEqual = false;
  Constrs.push_back(Constr);
  Constr.clear();
  for (auto SVar : SVars) {
    Constr.LHS.push_back(PBTerm(-1, SVar));
    Constr.LHS.push_back(PBTerm(1, SVarRes));
    Constr.RHS = 0;
    Constr.IsEqual = false;
    Constrs.push_back(Constr);
    Constr.clear();
  }
}

void ProblemGenerator::dumpPBVar2Str(std::ostream &OS) const {
  for (auto ID_Str : ID2Str) {
    OS << "x" << ID_Str.first << ": " << ID_Str.second << std::endl;
  }
}

void ProblemGenerator::dumpSID2LocInfo(std::ostream &OS,
                                       const LogMgr &LM) const {
  std::vector<std::size_t> SIDs;
  for (std::size_t i = 0; i < SID2Uuid.size(); ++i) {
    SIDs.push_back(i);
  }

  struct SIDSorter {
    SIDSorter(const LogMgr &lm, const std::vector<UUID_t> &sid2uuid)
        : LM(lm), SID2Uuid(sid2uuid) {}

    bool operator()(std::size_t LHS, std::size_t RHS) const {
      const LocInfo &LHSLoc = LM.getLocInfo(SID2Uuid[LHS]);
      const LocInfo &RHSLoc = LM.getLocInfo(SID2Uuid[RHS]);
      return std::make_tuple(LHSLoc.File, LHSLoc.Line, LHSLoc.Col) <
        std::make_tuple(RHSLoc.File, RHSLoc.Line, RHSLoc.Col);
    }
    const LogMgr &LM;
    const std::vector<UUID_t> &SID2Uuid;
  };

  // std::sort(SIDs.begin(), SIDs.end(), SIDSorter(LM, SID2Uuid));
  for (auto SID : SIDs) {
    UUID_t Uuid = SID2Uuid[SID];
    const LocInfo &Loc = LM.getLocInfo(Uuid);
    OS << "SID=" << SID << ": UUID=" << Uuid.toString() << ", File="
       << Loc.File << ", Line=" << Loc.Line << ", Col=" << Loc.Col << std::endl;
  }
}
