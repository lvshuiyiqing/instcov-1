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
#include <list>
#include <map>
#include <iostream>
#include "llvm/ADT/StringMap.h"
#include "instcov/LogMgr.h"

namespace instcov {
class ProblemGenerator;

typedef std::size_t PBVar;
struct SignedPBVar : public std::pair < PBVar, bool > {
  typedef std::pair<PBVar, bool> base_t;
  SignedPBVar(void) : base_t() {}
  SignedPBVar(const PBVar &a, const bool &b) : base_t(a, b) {}
	struct SVarPrinter {
    virtual std::string operator()(const SignedPBVar &SVar) const = 0;
  };
  PBVar getPBVar(void) const { return first; }
  bool getSign(void) const { return second; }
  SignedPBVar getNeg(void) const { return SignedPBVar(first, !second); }
  void emit(std::ostream &OS, const SVarPrinter &SVP) const;
};

typedef std::list<SignedPBVar> SVarList;
struct PBTerm : std::pair<int, SVarList> {
  typedef std::pair<int, SVarList> base_t;
  PBTerm(void) : base_t() {}
  PBTerm(const int &a, const SVarList &b) : base_t(a, b) {}
  const SVarList &getSVars(void) const { return second; }
  int getWeight(void) const { return first; }
  void emit(std::ostream &OS, const SignedPBVar::SVarPrinter &SVP) const;
};

// third tuple indicates whether the variable is positive, i.e. false means "~x"
struct PBLinear : public std::vector<PBTerm> {
  typedef std::vector<PBTerm> base_t;
  PBLinear(void) : base_t() {}
  PBLinear(std::size_t count,
           const base_t::value_type &value = base_t::value_type())
      : base_t(count, value) {}
  template<typename InputIt>
  PBLinear(InputIt first, InputIt last)
      : base_t(first, last) {}
  void emit(std::ostream &OS, const SignedPBVar::SVarPrinter &SVP) const;
};
  
struct PBConstr {
  PBConstr(void)
      : LHS(), RHS(0), IsEqual(false) {}
  PBConstr(const PBLinear &lhs, int rhs, bool isEqual)
      : LHS(lhs), RHS(rhs), IsEqual(isEqual) {}
  void emitRaw(std::ostream &OS) const;
  void emitPretty(std::ostream &OS, const ProblemGenerator &PG) const;
  void emit(std::ostream &OS, const SignedPBVar::SVarPrinter &SVP) const;
  void clear(void) {
    LHS.clear();
    RHS = 0;
    IsEqual = false;
  }

  PBLinear LHS;
  int RHS;
  bool IsEqual; // >= if false
};

struct PBOProblem {
  PBOProblem(void)
      : NumVars(0), NumConstrs(0), NumProducts(0), SizeProducts(0) {}
  std::size_t NumVars;
  std::size_t NumConstrs;
  std::size_t NumProducts;
  std::size_t SizeProducts;

  void countProducts(void);
  
  void emit(std::ostream &OS, const SignedPBVar::SVarPrinter &SVP) const;
  void emitPretty(std::ostream &OS, const ProblemGenerator &PG) const;
  void emitRaw(std::ostream &OS) const;
  
  PBLinear ObjFunc;
  std::vector<PBConstr> ConditionMatch;
  std::vector<PBConstr> VisitMatch;
  std::vector<PBConstr> CDAssgnMatch;
  std::vector<PBConstr> AssgnPair;
  std::vector<PBConstr> Assgn;

 private:
  void countProducts(const std::vector<PBConstr> &Constrs);
};

class ProblemGenerator {
 public:
  ProblemGenerator(void);
  ~ProblemGenerator(void);

  void registerLogEntry(const LogEntry *E);
  PBOProblem emitPBO(void);

  void dumpPBVar2Str(std::ostream &OS) const;
  void dumpSID2LocInfo(std::ostream &OS, const LogMgr &LM) const;
  const std::string &decodePBVar(PBVar ID) const;
  
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
  
  void pboEmitObj(PBOProblem &Problem);
  void pboEmitAssgn(PBOProblem &Problem, const LogEntry *E);
  void pboEmitOneAssgn(
      PBOProblem &Problem,
      std::size_t TID, std::size_t VID,
      const std::pair<UUID_t, uint64_t> &Assgn);
  void pboEmitAssgnPair(
      PBOProblem &Problem,
      const LogEntry *E1, const LogEntry *E2);
  void pboEmitOneAssgnPair(
      PBOProblem &Problem, UUID_t Uuid,
      std::size_t TID1, std::size_t VID1,
      std::size_t TID2, std::size_t VID2);
  void pboEmitPerDecision(
      PBOProblem &Problem, UUID_t UuidD);
  void pboEmitConditionMatches(
      PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC);
  void pboEmitVisitMatches(
      PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC);
  void pboEmitOneVisitMatch(
      PBOProblem &Problem, UUID_t UuidD, UUID_t UuidC,
      const LogEntry *E1, const LogEntry *E2);
  void pboEmitPerVisit(PBOProblem &Problem);

  void genPBIdiomAnd(SignedPBVar Var1, SignedPBVar Var2, SignedPBVar VarRes,
                     std::vector<PBConstr> &Constrs);
  void genPBIdiomAnd(const SVarList &Vars, SignedPBVar VarRes,
                     std::vector<PBConstr> &Constrs);
  void genPBIdiomOr(SignedPBVar Var1, SignedPBVar Var2, SignedPBVar VarRes,
                    std::vector<PBConstr> &Constrs);
  void genPBIdiomOr(const SVarList &Vars, SignedPBVar VarRes,
                    std::vector<PBConstr> &Constrs);
  
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
