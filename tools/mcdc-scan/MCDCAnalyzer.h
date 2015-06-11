//===-- MCDCAnalyzer.h ------- MC/DC analyzer class -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the class for trace log manager
///
//===----------------------------------------------------------------------===//

#ifndef MCDCAnalyzer_H_
#define MCDCAnalyzer_H_

#include "LogMgr.h"

namespace instcov {
class MCDCAnalyzer {
 public:
  virtual void registerEntry(const LogEntry *entry) = 0;
  virtual void dump(std::ostream &OS, const LogMgr &LM) const = 0;
};
}

#endif  // MCDCAnalyzer_H_
