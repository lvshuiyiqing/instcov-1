//===-- DCRecord.h ------------- DCRecord class -----------------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for DCRecord, which is formated
/// \brief from DCRecordBuilder, and is used for MCDCAnalyzers
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DCRecord_H_
#define INSTCOV_DCRecord_H_

#include <string>
#include <map>
#include <set>
#include <iostream>
#include <memory>
#include <vector>
#include <algorithm>
#include "instcov/uuid.h"
#include "instcov/DbgInfo.h"

namespace instcov {
class DCRecord {
 public:
  DCRecord(void)
      : TID(-1), VID(-1) {}

  void dump(std::ostream &OS) const;
  std::map<UUID_t, uint64_t> Cond2Val;
  std::pair<UUID_t, uint64_t> DecVal;
  std::size_t TID;
  std::size_t VID;
};

}

#endif  // INSTCOV_DCRECORD_H_
