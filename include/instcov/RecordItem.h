//===-- RecordItem.h ------------- RecordItem classes -----------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the declarations for record items
///
//===----------------------------------------------------------------------===//

#ifndef INSTCOV_RECORDITEM_H_
#define INSTCOV_RECORDITEM_H_

#include <iostream>
#include "instcov/uuid.h"
#include "instcov/LogMgr.h"

namespace instcov {
struct RecordItem {
 public:
  enum RIKind {
    RIK_DC,
    RIK_SWITCH,
    RIK_FUNC,
  };

  RecordItem(RIKind kind)
      : Kind(kind), Uuid() {}
  RecordItem(RIKind kind, UUID_t uuid)
      : Kind(kind), Uuid(uuid) {}
  virtual ~RecordItem(void) {}
  RIKind getKind(void) const { return Kind; }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const = 0;
  virtual void dumpPretty(std::ostream &OS) const = 0;

 private:
  const RIKind Kind;
 public:
  UUID_t Uuid;
};

struct RecordItem_DC : public RecordItem {
  RecordItem_DC(void)
      : RecordItem(RIK_DC), BID(BID_NA) {}
  RecordItem_DC(UUID_t uuid)
      : RecordItem(RIK_DC, uuid) {}
  RecordItem_DC(UUID_t uuid, uint64_t bid)
      : RecordItem(RIK_DC, uuid), BID(bid) {}

  static bool classof(const RecordItem *RI) {
    return RI->getKind() == RIK_DC;
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

struct RecordItem_Switch : public RecordItem {
  RecordItem_Switch(void)
      : RecordItem(RIK_SWITCH), BID(BID_NA) {}
  RecordItem_Switch(UUID_t uuid)
      : RecordItem(RIK_SWITCH, uuid), BID(BID_NA) {}
  RecordItem_Switch(UUID_t uuid, uint64_t bid)
      : RecordItem(RIK_SWITCH, uuid), BID(bid) {}

  static bool classof(const RecordItem *RI) {
    return RI->getKind() == RIK_SWITCH;
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

struct RecordItem_Func : public RecordItem {
  RecordItem_Func(void)
      : RecordItem(RIK_FUNC) {}
  RecordItem_Func(UUID_t uuid)
      : RecordItem(RIK_FUNC, uuid) {}
  static bool classof(const RecordItem *RI) {
    return RI->getKind() == RIK_FUNC;
  }
  virtual void loadBodyFromFile(std::istream &File);
  virtual const char *getStrKind(void) const {
    static const char strKind[] = "FUNC";
    return strKind;
  }
  virtual void dumpPretty(std::ostream &OS) const;

};
}

#endif  // INSTCOV_RECORDITEM_H_
