//===-- LogMgr.cpp ------ LogMgr class method definitions -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the method definitions of LogMgr
///
//===----------------------------------------------------------------------===//

#include <tuple>
#include <stack>
#include <fstream>
#include <iostream>
#include "LogMgr.h"

using namespace instcov;

namespace {
void eatOrQuit(std::istream &In, const std::string &str) {
  for (auto it = str.begin(), ie = str.end(); it != ie; ++it) {
    if (In.get() != *it) {
      std::cerr << "error matching: " << str << std::endl;
      exit(1);
    }
    if (!In) {
      std::cerr << "error matching: " << str << std::endl;
      exit(1);
    }
  }
}

std::tuple<unsigned, UUID_t, uint64_t> parseLine(std::istream &In, bool &success) {
  unsigned depth = 0;
  UUID_t Uuid;
  uint64_t Bid = 0;
  std::string line;
  if (!std::getline(In, line) || line.empty()) {
    success = false;  // last line
    return std::make_tuple(depth, Uuid, Bid);
  }
  std::stringstream ss(line);
  while (ss.peek() == '-') {
    ++depth;
    ss.get();
  }
  ss.peek();
  if (ss.eof() || !ss) {
    std::cerr << "bad log\n";
    exit(1);
  }
  std::string strUUID;
  getline(ss, strUUID, ':');
  Uuid = UUID_t::parseString(strUUID);
  //eatOrQuit(ss, ":");
  ss >> Bid;
  return std::make_tuple(depth, Uuid, Bid);
}
}

LogMgr::LogMgr() {
}

LogMgr::~LogMgr() {
}

void LogMgr::loadFile(const std::string &fileName) {
  std::ifstream InFile(fileName.c_str());
  if (!InFile) {
    std::cerr << "cannot open file: " << fileName << std::endl;
    exit(1);
  }

  FileNames.push_back(fileName);
  std::stack<std::vector<std::pair<UUID_t, uint64_t> > > S;
  S.push(std::vector<std::pair<UUID_t, uint64_t> >());
  bool success = true;
  while (true) {
    auto PL = parseLine(InFile, success);
    if (!success) {
      break;
    }
    unsigned depth = 0;
    UUID_t Uuid;
    uint64_t Bid;
    std::tie(depth, Uuid, Bid) = PL;
    while (depth+1 < S.size()) {
      if (S.top().empty()){
        S.pop();
      } else {
        LogEntry Entry;
        Entry.FID = FileNames.size();
        Entry.RID = LogEntries.size();
        Entry.Conditions.clear();
        Entry.Conditions.insert(S.top().begin(), S.top().end());
        S.pop();
        Entry.Decision = S.top().back();
        for (auto it = Entry.Conditions.begin(), ie = Entry.Conditions.end();
             it != ie; ++it) {
          Children[Entry.Decision.first].insert(it->first);
        }
        LogEntries.push_back(Entry);
      }
    }
    if (depth+1 == S.size()) {
      S.top().push_back(std::make_pair(Uuid, Bid));
      S.push(std::vector<std::pair<UUID_t, uint64_t> >());
      continue;
    }
  }
  while (1 < S.size()) {
    if (S.top().empty()){
      S.pop();
    } else {
      LogEntry Entry;
      Entry.FID = FileNames.size();
      Entry.RID = LogEntries.size();
      Entry.Conditions.clear();
      Entry.Conditions.insert(S.top().begin(), S.top().end());
      S.pop();
      Entry.Decision = S.top().back();
      for (auto it = Entry.Conditions.begin(), ie = Entry.Conditions.end();
           it != ie; ++it) {
        Children[Entry.Decision.first].insert(it->first);
      }
      LogEntries.push_back(Entry);
    }
  }
}
