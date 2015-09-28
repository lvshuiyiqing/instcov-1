//===-- CheckLocation.cpp ------ CheckLocation definition -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definitions for location checker, to check
/// whether a statement/declaration is in a desired location.
///
//===----------------------------------------------------------------------===//

#include "llvm/Support/CommandLine.h"
#include "llvm/ADT/StringSet.h"
#include "CheckLocation.h"

using namespace clang;

extern llvm::StringSet<llvm::MallocAllocator> MatchFileNames;

bool instcov::checkLocation(Stmt *s, clang::SourceManager &SM) {
  if (MatchFileNames.empty()) {
    return true;
  }
  StringRef PresumedFileName =
      SM.getPresumedLoc(s->getLocStart()).getFilename();
  return MatchFileNames.count(PresumedFileName);
}

bool instcov::checkLocation(Decl *d, clang::SourceManager &SM) {
  if (MatchFileNames.empty()) {
    return true;
  }
  StringRef PresumedFileName =
      SM.getPresumedLoc(d->getLocStart()).getFilename();
  return MatchFileNames.count(PresumedFileName);
}
