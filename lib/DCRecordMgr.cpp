//===-- RecordMgr.cpp ----- trace record manager definition -----*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition for trace record manager
///
//===----------------------------------------------------------------------===//

#include <cstdlib>
#include <fstream>
#include <stack>
#include "llvm/Support/raw_ostream.h"
#include "instcov/DCRecordMgr.h"

using namespace instcov;
using namespace llvm;

void RecordMgr::processTrace(const RawRecordMgr &RM) {
  std::stack<std::shared_ptr<DISlotTree> > TreeStack;
  // read records
  for (auto &RI : RM.getRecordItems()) {
    if (!isa<RecordItem_DC>(RI)) {
      continue;
    }
    RecordItem_DC *RIDC = cast<RecordItem_DC>(RI);
    if (DIM.isDC(RIDC->Uuid) == 0) {
      llvm::errs() << "cannot find UUID in debug info database!!\n"
                   << "did you run the program again after recompiling?\n";
      exit(1);
    }
    if (TreeStack.empty() || !TreeStack.top()->canAccept(RIDC->Uuid)) {
      // llvm::errs() << "creating a new tree\n";
      TreeStack.push(std::shared_ptr<DISlotTree>(
          new DISlotTree(getDIM().toRoot4DC(RIDC->Uuid), getDIM())));
    }
    // llvm::errs() << "current root:"  << TreeStack.top()->R->Uuid.toString() << "\n";
    TreeStack.top()->fill(RIDC->Uuid, RIDC->BID);
    if (TreeStack.top()->isRootFilled()) {
      RecordTrees.push_back(TreeStack.top());
      TreeStack.pop();
    }
  }
}

void RecordMgr::dump(std::ostream &OS) const {
  for (auto &RecordTree : RecordTrees) {
    RecordTree->dump(OS);
  }
}
