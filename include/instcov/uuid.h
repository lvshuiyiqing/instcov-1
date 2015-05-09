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
#ifdef _WIN32
#include <Rpc.h>
#else
#include <uuid/uuid.h>
#endif

namespace instcov {
struct UUID {
 public:
  UUID(void)
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

  static UUID parseString(const std::string &str) {
    UUID result;
    std::stringstream high("0x");
    std::stringstream low("0x");
    if (str.size() > 8) {
      std::size_t pos = str.size() - 8;
      high << str.substr(0, pos);
      low << str.substr(pos);
    } else {
      low << str;
    }
    high >> result.high;
    low >> result.low;
    return result;
  }

 public:
  uint64_t high;
  uint64_t low;
};

inline UUID genUUID(void) {
  UUID result;
#ifdef _WIN32
  UuidCreate(reinterpret_cast<::UUID *>(&result));
#else
  uuid_generate(*(reinterpret_cast<uuid_t*>(&result)));
#endif
  return result;
}

inline bool operator < (const instcov::UUID &left, const instcov::UUID &right) {
  return std::make_tuple(left, right) < std::make_tuple(left, right);
}

inline bool operator == (const instcov::UUID &left, const instcov::UUID &right)
{
  return std::make_tuple(left, right) == std::make_tuple(left, right);
}
}

#endif  // INSTCOV_UUID_H_
