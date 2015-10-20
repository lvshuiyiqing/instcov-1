//===-- PBOProblem.h -------- classes for PBO problems ----------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the classes for PBO problems
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_PBOPROBLEM_H_
#define INSTCOV_PBOPROBLEM_H_

#include <vector>
#include <map>
#include <string>

namespace instcov {
typedef std::size_t PBVar;

struct PBVarPrinter {
  virtual ~PBVarPrinter(void) {}
  virtual std::string operator()(PBVar Var) const = 0;
};

struct SignedPBVar : public std::pair<PBVar, bool> {
  typedef std::pair<PBVar, bool> base_t;
  SignedPBVar(void) : base_t() {}
  SignedPBVar(const PBVar &a, const bool &b) : base_t(a, b) {}
  PBVar getPBVar(void) const { return first; }
  bool getSign(void) const { return second; }
  SignedPBVar getNeg(void) const { return SignedPBVar(first, !second); }
  void emit(std::ostream &OS, const PBVarPrinter &VP) const;

  // DO NOT ADD MEMBERS!!!
};

typedef std::vector<SignedPBVar> SVarList;

struct PBTerm : std::pair<int, SignedPBVar> {
  typedef std::pair<int, SignedPBVar> base_t;
  PBTerm(void) : base_t() {}
  PBTerm(const int &a, const SignedPBVar &b) : base_t(a, b) {}
  const SignedPBVar &getSVar(void) const { return second; }
  int getWeight(void) const { return first; }
  void emit(std::ostream &OS, const PBVarPrinter &VP) const;

  // DO NOT ADD MEMBERS!!!
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
  void emit(std::ostream &OS, const PBVarPrinter &VP) const;

  // DO NOT ADD MEMBERS!!!
};

struct PBConstr {
  PBConstr(void)
      : LHS(), RHS(0), IsEqual(false) {}
  PBConstr(const PBLinear &lhs, int rhs, bool isEqual)
      : LHS(lhs), RHS(rhs), IsEqual(isEqual) {}
  void emit(std::ostream &OS, const PBVarPrinter &VP) const;
  void clear(void) {
    LHS.clear();
    RHS = 0;
    IsEqual = false;
  }

  PBLinear LHS;
  int RHS;
  bool IsEqual; // >= if false
};

void genPBIdiomAnd(SignedPBVar Var1, SignedPBVar Var2, SignedPBVar VarRes,
                   std::vector<PBConstr> &Constrs);
void genPBIdiomAnd(const SVarList &Vars, SignedPBVar VarRes,
                   std::vector<PBConstr> &Constrs);
void genPBIdiomOr(SignedPBVar Var1, SignedPBVar Var2, SignedPBVar VarRes,
                  std::vector<PBConstr> &Constrs);
void genPBIdiomOr(const SVarList &Vars, SignedPBVar VarRes,
                  std::vector<PBConstr> &Constrs);

void emitConstrs(
    const std::vector<PBConstr> &Constrs, std::ostream &OS,
    const PBVarPrinter &VP);

struct PBOProblem {
  PBOProblem(void)
      : NumVars(0), NumConstrs(0) {}
  virtual ~PBOProblem() {}
  std::size_t NumVars;
  std::size_t NumConstrs;

  void emitHeader(std::ostream &OS) const;
  void emitObj(std::ostream &OS, const PBVarPrinter &VP) const;
  virtual void emitConstrs(std::ostream &OS, const PBVarPrinter &VP) const;
  void emit(std::ostream &OS, const PBVarPrinter &VP) const;
  void emitPretty(std::ostream &OS,
                  const std::map<PBVar, std::string> &ID2Str) const;
  void emitRaw(std::ostream &OS) const;

  PBLinear ObjFunc;
  std::vector<PBConstr> GeneralConstrs;
};
}

#endif  // INSTCOV_PBOPROBLEM_H_
