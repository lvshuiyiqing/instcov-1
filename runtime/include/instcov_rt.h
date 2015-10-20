//===-- instcov_rt.h -------- InstCov runtime include file ------*- C++ -*-===//
//
//                     The InstCov Code Instrumentation Tool
//
// This file is distributed under the MIT License.
// See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the runtime function declarations for InstCov
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RT_H_
#define INSTCOV_RT_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus
  void instcov_dc_dump(uint64_t id_high, uint64_t id_low, uint64_t bid);
  void instcov_switch_dump(uint64_t id_high, uint64_t id_low, uint64_t bid);
  void instcov_func_dump(uint64_t id_high, uint64_t id_low);
#ifdef __cplusplus
}
#endif  // __cplusplus

#endif  // INSTCOV_RT_H_
