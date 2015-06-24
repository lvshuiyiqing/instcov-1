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
#include "ProblemGenerator.h"

using namespace llvm;
using namespace instcov;

void PBTerm::emit(std::ostream &OS) const {
  OS << (getWeight() > 0 ? "+" : "") << getWeight()
     << " " << (getSVar().getSign() ? "" : "~")
     << "x" << getSVar().getPBVar();
}

void PBLinear::emit(std::ostream &OS) const {
  bool IsFirst = true;
  for (auto it = begin(), ie = end(); it != ie; ++it) {
    if (IsFirst) {
      IsFirst = false;
    } else {
      OS << " ";      
    }
    it->emit(OS);
  }
}

void PBConstr::emit(std::ostream &OS) const {
  if (LHS.empty()) {
    std::cerr << "LHS is empty, why?" << std::endl;
    exit(1);
  }
  LHS.emit(OS);
  OS << " " << (IsEqual ? "=" : ">=") << " ";
  if (RHS > 0) {
    OS << "+";
  }
  OS << RHS << ";" << std::endl;
}

namespace {
void emitConstrs(const std::vector<PBConstr> &Constrs, std::ostream &OS) {
  for (auto it = Constrs.begin(), ie = Constrs.end(); it != ie; ++it) {
    it->emit(OS);
  }
}
}

void PBOProblem::emit(std::ostream &OS) const {
  if (!ObjFunc.empty()) {
    OS << "min: ";
    ObjFunc.emit(OS);
    OS << ";";
  }
  emitConstrs(ConditionMatch, OS);
  emitConstrs(VisitMatch, OS);
  emitConstrs(CDAssgnMatch, OS);
  emitConstrs(AssgnPair, OS);
  emitConstrs(Assgn, OS);
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
    for (auto it = E->Conditions.begin(), ie = E->Conditions.end();
         it != ie; ++it) {
      Children[E->Decision.first].push_back(it->first);
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
  ss << "cm" << getSID(UuidC);
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeVisitMatch(
      UUID_t UuidC,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2) {
  std::stringstream ss;
  ss << "vm" << getSID(UuidC)
     << "_" << TID1 << "_" << VID1
     << "_" << TID2 << "_" << VID2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeCDAssgnMatch(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2) {
  std::stringstream ss;
  ss << "cdm" << getSID(Uuid)
     << "_" << TID1 << "_" << VID1
     << "_" << TID2 << "_" << VID2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeAssgnPair(
      UUID_t Uuid,
      std::size_t TID1, std::size_t VID1, char Assgn1,
      std::size_t TID2, std::size_t VID2, char Assgn2) {
  std::stringstream ss;
  ss << "ap" << getSID(Uuid)
     << "_" << TID1 << "_" << VID1 << "_" << Assgn1
     << "_" << TID2 << "_" << VID2 << "_" << Assgn2;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeAssgn(
      UUID_t Uuid,
      std::size_t TID, std::size_t VID, char Assgn) {
  std::stringstream ss;
  ss << "a" << getSID(Uuid)
     << "_" << TID << "_" << VID << "_" << Assgn;
  return encodeStr(ss.str());
}

PBVar ProblemGenerator::encodeT(std::size_t TID) {
  std::stringstream ss;
  ss << "t" << TID;
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

PBOProblem ProblemGenerator::emitPBO(void) {
  PBOProblem Problem;
  pboEmitObj(Problem);
  for (auto it = Uuid2LogEntries.begin(), ie = Uuid2LogEntries.end();
       it != ie; ++it) {
    for (auto ite = it->second.begin(), iee = it->second.end();
         ite != iee; ++ite) {
      pboEmitAssgn(Problem, *ite);
    }
  }
  for (auto itd = Uuid2LogEntries.begin(), ied = Uuid2LogEntries.end();
       itd != ied; ++itd) {
    pboEmitPerDecision(Problem, itd->first);
  }
  return Problem;
}

void ProblemGenerator::pboEmitObj(PBOProblem &Problem) {
}

void ProblemGenerator::pboEmitAssgn(PBOProblem &Problem, const LogEntry *E) {
  pboEmitOneAssgn(Problem, E->TID, E->VID, E->Decision);
  for (auto it = E->Conditions.begin(), ie = E->Conditions.end();
       it != ie; ++it) {
    pboEmitOneAssgn(Problem, E->TID, E->VID, *it);
  }
}

void ProblemGenerator::pboEmitOneAssgn(
    PBOProblem &Problem,
    std::size_t TID, std::size_t VID,
    const std::pair<UUID_t, uint64_t> &Assgn) {
  PBVar VarTrue = encodeAssgn(Assgn.first, TID, VID, 'T');
  PBVar VarFalse = encodeAssgn(Assgn.first, TID, VID, 'F');
  Problem.Assgn.push_back(PBConstr(
      PBLinear(1, PBTerm(1, SignedPBVar(VarTrue, true))),
      Assgn.second == 1, true));
  Problem.Assgn.push_back(PBConstr(
      PBLinear(1, PBTerm(1, SignedPBVar(VarFalse, true))),
      Assgn.second == 0, true));
}

void ProblemGenerator::pboEmitPerDecision(
    PBOProblem &Problem, UUID_t UuidD) {
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
  for (auto it = Conditions.begin(), ie = Conditions.end(); it != ie; ++it) {
    pboEmitVisitMatches(Problem, UuidD, *it);
    pboEmitConditionMatches(Problem, UuidD, *it);
  }
}

void ProblemGenerator::pboEmitAssgnPair(
    PBOProblem &Problem, const LogEntry *E1, const LogEntry *E2) {
  UUID_t UuidD = E1->Decision.first;
  pboEmitOneAssgnPair(
      Problem, UuidD,
      E1->TID, E1->VID, E2->TID, E2->VID);
  for (auto it = Children[UuidD].begin(), ie = Children[UuidD].end();
       it != ie; ++it) {
    pboEmitOneAssgnPair(Problem, *it, E1->TID, E1->VID, E2->TID, E2->VID);
  }
}

void ProblemGenerator::pboEmitOneAssgnPair(
    PBOProblem &Problem, UUID_t Uuid,
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
    PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC) {
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
    PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC,
    const LogEntry *E1, const LogEntry *E2) {
  const auto &Conditions = Children[UuidD];
  std::vector<SignedPBVar> SVars;
  for (auto it = Conditions.begin(), ie = Conditions.end(); it != ie; ++it) {
    PBVar Var = encodeCDAssgnMatch(*it, E1->TID, E1->VID, E2->TID, E2->VID);
    SVars.push_back(SignedPBVar(Var, *it != UuidC));
  }
  SVars.push_back(SignedPBVar(
      encodeCDAssgnMatch(UuidD, E1->TID, E1->VID, E2->TID, E2->VID), false));
  SVars.push_back(SignedPBVar(encodeT(E1->TID), true));
  SVars.push_back(SignedPBVar(encodeT(E1->TID), true));
  PBVar VarVisitMatch = encodeVisitMatch(
      UuidC, E1->TID, E1->VID, E2->TID, E2->VID);
  genPBIdiomAnd(SVars, SignedPBVar(VarVisitMatch, true), Problem.VisitMatch);
}

void ProblemGenerator::pboEmitConditionMatches(
    PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC) {
  std::vector<SignedPBVar> SVars;
  const auto &Entries = Uuid2LogEntries[UuidD];
  for (auto it1 = Entries.begin(), ie = Entries.end(); it1 != ie; ++it1) {
    auto it2 = it1;
    ++it2;
    for (; it2 != ie; ++it2) {
      SVars.push_back(SignedPBVar(
          encodeCDAssgnMatch(
              UuidC, (*it1)->TID, (*it1)->VID, (*it2)->TID, (*it2)->VID),
          true));
    }    
  }
  PBVar VarConditionMatch = encodeConditionMatch(UuidC);
  genPBIdiomOr(SVars, SignedPBVar(VarConditionMatch, true),
               Problem.ConditionMatch);
}

void ProblemGenerator::genPBIdiomAnd(
    SignedPBVar SVar1, SignedPBVar SVar2, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  std::vector<SignedPBVar> SVars;
  SVars.push_back(SVar1);
  SVars.push_back(SVar2);
  genPBIdiomAnd(SVars, SVarRes, Constrs);
}

void ProblemGenerator::genPBIdiomAnd(
    const std::vector<SignedPBVar> &SVars, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  PBConstr Constr;
  Constr.LHS.push_back(PBTerm(1, SVarRes));
  for (auto it = SVars.begin(), ie = SVars.end(); it != ie; ++it) {
    Constr.LHS.push_back(PBTerm(-1, *it));
  }
  Constr.RHS = 1 - SVars.size();
  Constr.IsEqual = false;
  Constrs.push_back(Constr);
  Constr.clear();
  for (auto it = SVars.begin(), ie = SVars.end(); it != ie; ++it) {
    Constr.LHS.push_back(PBTerm(1, *it));
    Constr.LHS.push_back(PBTerm(-1, SVarRes));
    Constr.RHS = 0;
    Constr.IsEqual = false;
    Constrs.push_back(Constr);
    Constr.clear();
  }
}

void ProblemGenerator::genPBIdiomOr(
    SignedPBVar SVar1, SignedPBVar SVar2, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  std::vector<SignedPBVar> SVars;
  SVars.push_back(SVar1);
  SVars.push_back(SVar2);
  genPBIdiomOr(SVars, SVarRes, Constrs);
}

void ProblemGenerator::genPBIdiomOr(
    const std::vector<SignedPBVar> &SVars, SignedPBVar SVarRes,
    std::vector<PBConstr> &Constrs) {
  PBConstr Constr;
  Constr.LHS.push_back(PBTerm(-1, SVarRes));
  for (auto it = SVars.begin(), ie = SVars.end(); it != ie; ++it) {
    Constr.LHS.push_back(PBTerm(1, *it));
  }
  Constr.RHS = -1;
  Constr.IsEqual = false;
  Constrs.push_back(Constr);
  Constr.clear();
  for (auto it = SVars.begin(), ie = SVars.end(); it != ie; ++it) {
    Constr.LHS.push_back(PBTerm(-1, *it));
    Constr.LHS.push_back(PBTerm(1, SVarRes));
    Constr.RHS = 0;
    Constr.IsEqual = false;
    Constrs.push_back(Constr);
    Constr.clear();
  }
}
