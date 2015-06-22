//===-- DbgInfo.h --------------- DbgInfo classes ---------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for location info
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_DBGINFO_H_
#define INSTCOV_DBGINFO_H_

#include <string>
#include "instcov/uuid.h"

namespace instcov {
struct LocInfo {
  LocInfo(void)
      : Line(0), Col(0) {}
  LocInfo(const std::string &file, unsigned line, unsigned col)
      : File(file), Line(line), Col(col) {}
  
  std::string File;
  uint64_t Line;
  uint64_t Col;
};

struct DbgInfo {
  DbgInfo(void)
      : Loc(), Uuid(), Uuid_P() {}
  DbgInfo(const LocInfo &loc, UUID_t uuid, UUID_t uuid_p)
      : Loc(loc), Uuid(uuid), Uuid_P(uuid_p) {}

  LocInfo Loc;
  UUID_t Uuid;
  UUID_t Uuid_P;
  std::vector<UUID_t> Children;
};
}

#endif  // INSTCOV_DBGINFO_H_
