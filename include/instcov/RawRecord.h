//===-- RawRecord.h -------- RawRecord classes declaration ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for raw record items
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RAWRECORD_H_
#define INSTCOV_RAWRECORD_H_

#include <iostream>
#include "instcov/uuid.h"

namespace instcov {
const uint64_t BID_NA = ~(~((uint64_t)0)>>1);

struct RawRecord {
 public:
  enum RRKind {
    RRK_DC,
    RRK_SWITCH,
    RRK_FUNC,
  };

  RawRecord(RRKind kind)
      : Kind(kind), Uuid() {}
  RawRecord(RRKind kind, UUID_t uuid)
      : Kind(kind), Uuid(uuid) {}
  virtual ~RawRecord(void) {}
  RRKind getKind(void) const { return Kind; }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const = 0;
  virtual void dumpPretty(std::ostream &OS) const = 0;

 private:
  const RRKind Kind;
 public:
  UUID_t Uuid;
};

struct RawRecord_DC : public RawRecord {
  RawRecord_DC(void)
      : RawRecord(RRK_DC), BID(BID_NA) {}
  RawRecord_DC(UUID_t uuid)
      : RawRecord(RRK_DC, uuid) {}
  RawRecord_DC(UUID_t uuid, uint64_t bid)
      : RawRecord(RRK_DC, uuid), BID(bid) {}

  static bool classof(const RawRecord *RR) {
    return RR->getKind() == RRK_DC;
  }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const {
    static const char strKind[] = "DCDC";
    return strKind;
  }
  virtual void dumpPretty(std::ostream &OS) const;

 public:
  uint64_t BID;
};

struct RawRecord_Switch : public RawRecord {
  RawRecord_Switch(void)
      : RawRecord(RRK_SWITCH), BID(BID_NA) {}
  RawRecord_Switch(UUID_t uuid)
      : RawRecord(RRK_SWITCH, uuid), BID(BID_NA) {}
  RawRecord_Switch(UUID_t uuid, uint64_t bid)
      : RawRecord(RRK_SWITCH, uuid), BID(bid) {}

  static bool classof(const RawRecord *RR) {
    return RR->getKind() == RRK_SWITCH;
  }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const {
    static const char strKind[] = "SWTH";
    return strKind;
  }
  virtual void dumpPretty(std::ostream &OS) const;

 public:
  uint64_t BID;
};

struct RawRecord_Func : public RawRecord {
  RawRecord_Func(void)
      : RawRecord(RRK_FUNC) {}
  RawRecord_Func(UUID_t uuid)
      : RawRecord(RRK_FUNC, uuid) {}
  static bool classof(const RawRecord *RR) {
    return RR->getKind() == RRK_FUNC;
  }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const {
    static const char strKind[] = "FUNC";
    return strKind;
  }
  virtual void dumpPretty(std::ostream &OS) const;

};
}

#endif  // INSTCOV_RAWRECORD_H_
