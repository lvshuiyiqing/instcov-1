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

void instcov::emitConstrs(
    const std::vector<PBConstr> &Constrs, std::ostream &OS,
    const PBVarPrinter &VP) {
  for (auto &&Constr : Constrs) {
    Constr.emit(OS, VP);
  }
}

void PBOProblem::emit(std::ostream &OS, const PBVarPrinter &VP) const {
  OS << "* #variable= " << NumVars << " #constraint= " << NumConstrs;
  OS << std::endl;
  if (!ObjFunc.empty()) {
    OS << "min: ";
    ObjFunc.emit(OS, VP);
    OS << ";" << std::endl;
  } else {
    OS << "* no objective function" << std::endl;
  }
  OS << "* General Constrs" << std::endl;
  emitConstrs(GeneralConstrs, OS, VP);
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
