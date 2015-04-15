//===-- instcov_rt.h -------- InstCov runtime include file ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the runtime function declarations for InstCov
///
//===----------------------------------------------------------------------===//

#ifdef __cplusplus
#include <cstdint>
#else  // __cplusplus
#include <stdint.h>
#endif  // __cplusplus

extern "C" {
  void instcov_dump(uint64_t id_high, uint64_t id_low, uint64_t bid);
}
