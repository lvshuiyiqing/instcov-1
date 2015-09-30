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
#include <sstream>
#include <iostream>
#include "instcov/LogMgr.h"

using namespace instcov;

namespace {
void goPass(std::istream &In, char c) {
  while (In && In.get() != c) ;
}

std::tuple<unsigned, UUID_t, uint64_t, LocInfo>
parseLine(std::istream &In, bool &success) {
  while (true) {
    unsigned depth = 0;
    UUID_t Uuid;
    uint64_t Bid = 0;
    std::string line;
    LocInfo LI;
    if (!std::getline(In, line) || line.empty()) {
      success = false;  // last line
      return std::make_tuple(depth, Uuid, Bid, LI);
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
    if (ss.peek() == 'N') {
      ss.get();
      if (ss.get() != 'A') {
        std::cerr << "bad log, expecting \"NA\" or integer" << std::endl;
        exit(1);
      }
      Bid = BID_NA;
    } else {
      ss >> Bid;
      if (Bid >= 2) {
        // skip switches
        continue;
      }
    }
    goPass(ss, '(');
    std::string StrLoc;
    getline(ss, StrLoc);
    StrLoc.resize(StrLoc.size()-1);
    size_t loc1 = StrLoc.find(':');
    size_t loc2 = StrLoc.find(':', loc1+1);
    LI.Line = std::stoi(StrLoc.substr(0,loc1));
    LI.Col = std::stoi(StrLoc.substr(loc1+1, loc2-loc1-1));
    LI.File = StrLoc.substr(loc2+1);
    return std::make_tuple(depth, Uuid, Bid, LI);
  }
}
}

void LogEntry::dump(std::ostream &OS) const {
  OS << "TID=" << TID << " " << "VID=" << VID << std::endl;
  OS << DecVal.first.toString() << ":" << DecVal.second << std::endl;
  for (auto &&Cond_Val : Cond2Val) {
    OS << "-" << Cond_Val.first.toString()
       << ":" << Cond_Val.second << std::endl;
  }
}

// LogMgr::LogMgr() {
// }

// LogMgr::~LogMgr() {
// }

// void LogMgr::loadFile(const std::string &fileName) {
//   std::ifstream InFile(fileName.c_str());
//   if (!InFile) {
//     std::cerr << "cannot open file: " << fileName << std::endl;
//     exit(1);
//   }

//   FileNames.push_back(fileName);
//   std::stack<std::vector<std::pair<UUID_t, uint64_t> > > S;
//   S.push(std::vector<std::pair<UUID_t, uint64_t> >());
//   bool success = true;
//   size_t VID = 0;
//   while (true) {
//     auto PL = parseLine(InFile, success);
//     if (!success) {
//       break;
//     }
//     unsigned depth = 0;
//     UUID_t Uuid;
//     uint64_t Bid;
//     LocInfo LI;
//     std::tie(depth, Uuid, Bid, LI) = PL;
//     LocInfos[Uuid] = LI;
//     while (depth+1 < S.size()) {
//       if (S.top().empty()){
//         S.pop();
//       } else {
//         LogEntry Entry;
//         Entry.TID = FileNames.size();
//         Entry.VID = ++VID;
//         Entry.Cond2Val.clear();
//         Entry.Cond2Val.insert(S.top().begin(), S.top().end());
//         S.pop();
//         Entry.DecVal = S.top().back();
//         for (auto &&Cond_Val : Entry.Cond2Val) {
//           Children[Entry.DecVal.first].insert(Cond_Val.first);
//         }
//         LogEntries.push_back(Entry);
//       }
//     }
//     if (depth+1 == S.size()) {
//       S.top().push_back(std::make_pair(Uuid, Bid));
//       S.push(std::vector<std::pair<UUID_t, uint64_t> >());
//       continue;
//     }
//   }
//   while (1 < S.size()) {
//     if (S.top().empty()){
//       S.pop();
//     } else {
//       LogEntry Entry;
//       Entry.TID = FileNames.size();
//       Entry.VID = ++VID;
//       Entry.Cond2Val.clear();
//       Entry.Cond2Val.insert(S.top().begin(), S.top().end());
//       S.pop();
//       Entry.DecVal = S.top().back();
//       for (auto &Cond_Val : Entry.Cond2Val) {
//         Children[Entry.DecVal.first].insert(Cond_Val.first);
//       }
//       LogEntries.push_back(Entry);
//     }
//   }
// }
