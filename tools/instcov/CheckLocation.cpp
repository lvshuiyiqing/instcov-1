//===-- CheckLocation.cpp ------ CheckLocation definition -------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
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

namespace {
StringRef trimFileName(const StringRef &Str) {
#ifdef WIN32
  const char SEP = '\\';
#else  // WIN32
  const char SEP = '/';
#endif  // WIN32
  return Str.substr(Str.find_last_of(SEP)+1);
}
}

bool instcov::checkLocation(Stmt *s, clang::SourceManager &SM) {
  if (MatchFileNames.empty()) {
    return true;
  }
  StringRef PresumedFileName =
      SM.getPresumedLoc(s->getLocStart()).getFilename();
  StringRef Trimmed = trimFileName(PresumedFileName);
  return MatchFileNames.count(Trimmed);
}

bool instcov::checkLocation(Decl *d, clang::SourceManager &SM) {
  if (MatchFileNames.empty()) {
    return true;
  }
  StringRef PresumedFileName =
      SM.getPresumedLoc(d->getLocStart()).getFilename();
  StringRef Trimmed = trimFileName(PresumedFileName);
  return MatchFileNames.count(Trimmed);
}
