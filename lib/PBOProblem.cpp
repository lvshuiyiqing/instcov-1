//===-- PBOProblem.cpp -------- classes definition for PBO ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for PBO problem classes
///
//===----------------------------------------------------------------------===//

#include <iostream>
#include <sstream>
#include <algorithm>
#include "instcov/PBOProblem.h"

using namespace instcov;


void SignedPBVar::emit(std::ostream &OS,
                       const PBVarPrinter &VP) const {
  OS << (getSign() ? "" : "~") << VP(getPBVar());
}

void PBTerm::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  OS << (getWeight() > 0 ? "+" : "") << getWeight() << " ";
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

void instcov::emitConstrs(
    const std::vector<PBConstr> &Constrs, std::ostream &OS,
    const PBVarPrinter &VP) {
  for (auto &&Constr : Constrs) {
    Constr.emit(OS, VP);
  }
}

void PBOProblem::emitHeader(std::ostream &OS) const {
  OS << "* #variable= " << NumVars << " #constraint= " << NumConstrs
     << std::endl;
}

void PBOProblem::emitObj(std::ostream &OS, const PBVarPrinter &VP) const {
  if (!ObjFunc.empty()) {
    OS << "min: ";
    ObjFunc.emit(OS, VP);
    OS << ";" << std::endl;
  } else {
    OS << "* no objective function" << std::endl;
  }
}

void PBOProblem::emitConstrs(std::ostream &OS, const PBVarPrinter &VP) const {
  OS << "* General Constrs" << std::endl;
  instcov::emitConstrs(GeneralConstrs, OS, VP);  
}

void PBOProblem::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  emitHeader(OS);
  emitObj(OS, VP);
  emitConstrs(OS, VP);
}

void PBOProblem::emitRaw(std::ostream &OS) const {
  struct PBVarPrinterRaw : public PBVarPrinter {
    virtual std::string operator()(PBVar Var) const {
      std::stringstream ss;
      ss << "x" << Var;
      return ss.str();
    }
  };
  emit(OS, PBVarPrinterRaw());
}

void PBOProblem::emitPretty(
    std::ostream &OS, const std::map<PBVar, std::string> &ID2Str) const {
  struct PBVarPrinterPretty : public PBVarPrinter {
    PBVarPrinterPretty(const std::map<PBVar, std::string> &id2str)
        : ID2Str(id2str) {}
    virtual std::string operator()(PBVar Var) const {
      auto it = ID2Str.find(Var);
      if (it == ID2Str.end()) {
        std::cerr << "cannot find PBVar" << std::endl;
        exit(1);
      }
      return it->second;
    }
    const std::map<PBVar, std::string> &ID2Str;
  };
  emit(OS, PBVarPrinterPretty(ID2Str));
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
