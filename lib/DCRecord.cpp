//===-- DCRecord.cpp ----- DCRecord class method definitions ----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the method definitions of DCRecord
///
//===----------------------------------------------------------------------===//

#include <iostream>
#include "instcov/DCRecord.h"

using namespace instcov;

void DCRecord::dump(std::ostream &OS) const {
  OS << "TID=" << TID << " " << "VID=" << VID << std::endl;
  OS << DecVal.first.toString() << ":" << DecVal.second << std::endl;
  for (auto &&Cond_Val : Cond2Val) {
    OS << "-" << Cond_Val.first.toString()
       << ":" << Cond_Val.second << std::endl;
  }
}
