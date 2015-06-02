//===-- uuid.h ------------- uuid class -------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the uuid class
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_UUID_H_
#define INSTCOV_UUID_H_

#include <tuple>
#include <sstream>
#include <cstdint>
#ifdef _WIN32
#ifndef NOMINMAX
#define NOMINMAX
#include <Rpc.h>
#undef NOMINMAX
#endif
#else
#include <uuid/uuid.h>
#endif

namespace instcov {
struct UUID_t {
 public:
  UUID_t(void)
      : high(0), low(0) {}

  bool isValid(void) const {
    return (high | low);
  }

  std::string toArgString(void) const {
    std::stringstream ss;
    ss << std::hex << "0x" << high << "ull, 0x" << low << "ull";
    return ss.str();
  }

  std::string toString(void) const {
    std::stringstream ss;
    ss << std::hex << high << low;
    return ss.str();
  }

  static UUID_t parseString(const std::string &str) {
    UUID_t result;
    std::stringstream highStr;
    std::stringstream lowStr;
    if (str.size() > 16) {
      std::size_t pos = str.size() - 16;
      highStr << "0x" << str.substr(0, pos);
      lowStr << "0x" << str.substr(pos);
    } else {
      lowStr << str;
    }
    std::stringstream high(highStr.str());
    std::stringstream low(lowStr.str());
    high >> std::hex >> result.high;
    low >> std::hex >> result.low;
    return result;
  }

 public:
  uint64_t high;
  uint64_t low;
};

inline UUID_t genUUID(void) {
  UUID_t result;
#ifdef _WIN32
  UuidCreate(reinterpret_cast<::UUID *>(&result));
#else
  uuid_generate(*(reinterpret_cast<uuid_t*>(&result)));
#endif
  return result;
}

inline bool operator < (const instcov::UUID_t &left, const instcov::UUID_t &right) {
  return std::make_tuple(left.high, left.low) < std::make_tuple(right.high, right.low);
}

inline bool operator == (const instcov::UUID_t &left, const instcov::UUID_t &right)
{
  return std::make_tuple(left.high, left.low) == std::make_tuple(right.high, right.low);
}
}

#endif  // INSTCOV_UUID_H_
