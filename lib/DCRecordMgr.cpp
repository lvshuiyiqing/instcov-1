//===-- RecordMgr.cpp ----- trace record manager definition -----*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
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
#include <vector>
#include "llvm/Support/raw_ostream.h"
#include "instcov/DCRecordMgr.h"
#include "instcov/RawRecord.h"
#include "instcov/DCRecordBuilder.h"

using namespace instcov;
using namespace llvm;

void DCRecordMgr::processTrace(const RawRecordMgr &RM) {
  std::stack<std::shared_ptr<DCRecordBuilder> > DCRecordStack;
  // read records
  for (auto &RR : RM.getRecords()) {
    if (!isa<RawRecord_DC>(RR)) {
      continue;
    }
    RawRecord_DC *RRDC = cast<RawRecord_DC>(RR);
    if (DIM.isDC(RRDC->Uuid) == 0) {
      llvm::errs() << "cannot find UUID in debug info database!!\n"
                   << "did you run the program again after recompiling?\n";
      exit(1);
    }
    if (DCRecordStack.empty() || !DCRecordStack.top()->canAccept(RRDC->Uuid)) {
      // llvm::errs() << "creating a new tree\n";
      DCRecordStack.push(std::shared_ptr<DCRecordBuilder>(
          new DCRecordBuilder(getDIM().toRoot4DC(RRDC->Uuid), getDIM())));
    }
    // llvm::errs() << "current root:"  << TreeStack.top()->R->Uuid.toString() << "\n";
    DCRecordStack.top()->fill(RRDC->Uuid, RRDC->BID);
    if (DCRecordStack.top()->isRootFilled()) {
      RecordBuilders.push_back(DCRecordStack.top());
      DCRecordStack.pop();
    }
  }
}

// void DCRecordMgr::dump(std::ostream &OS) const {
//   for (auto &RecordTree : RecordTrees) {
//     RecordTree->dump(OS);
//   }
// }
