//===-- CheckLocation.h ------- CheckLocation declaration -------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for location checker, to check
/// whether a statement/declaration is in a desired location.
///
//===----------------------------------------------------------------------===//

#include "clang/AST/AST.h"
#include "clang/Basic/SourceManager.h"

namespace instcov {
bool checkLocation(clang::Stmt *s, clang::SourceManager &SM);
bool checkLocation(clang::Decl *d, clang::SourceManager &SM);
}
