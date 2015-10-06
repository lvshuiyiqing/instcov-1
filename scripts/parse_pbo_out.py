#!/usr/bin/env python
import sys

EMPTY_UUID = '00000000000000000000000000000000'

class LocInfo:
    File = ''
    Line = ''
    Col = ''

    def toString(self):
        return '({1}:{2}:{0})'.format(self.File, self.Line, self.Col)

class InfoMgr:
    VarDict = {}
    Uuid2Loc = {}
    SID2Uuid = {}
    Uuid2SID = {}
    Uuid2Children = {}
    Uuid2Parent = {}
    DOrder = []
    Vars = []

    def parseVarLine(self, line):
        PBVar, PrettyVar = tuple(line.split(": "))
        self.VarDict[PBVar] = PrettyVar

    def parseLocLine(self, line):
        fields = line.split(": ")
        SID = fields[0][4:]
        LI = LocInfo()
        Uuid, UuidP, LI.File, LI.Line, LI.Col = tuple(fields[1].split(', '))
        Uuid = Uuid[5:]
        UuidP = UuidP[7:]
        LI.File = LI.File[5:]
        LI.Line = LI.Line[5:]
        LI.Col = LI.Col[4:]
        self.Uuid2Loc[Uuid] = LI
        self.SID2Uuid[SID] = Uuid
        self.Uuid2SID[Uuid] = SID
        if UuidP != EMPTY_UUID:
            if UuidP not in self.Uuid2Children:
                self.Uuid2Children[UuidP] = []
                self.DOrder.append(UuidP)
            self.Uuid2Children[UuidP].append(Uuid)
        self.Uuid2Parent[Uuid] = UuidP

    def translateVar(self, Var):
        Neg = (Var[0] == '-')
        Var = self.VarDict[Var.lstrip('-')]
        Res = ''
        if Neg:
            Res += '-'
        Res += Var
        return Res

    def decomposeVar(self, Var):
        Sgn = (Var[0] != '-')
        DVar = Var.lstrip('-')
        return Sgn, DVar

    def loadPBOFile(self, PBOFile):
        for line in PBOFile:
            if not line.startswith('*'):
                continue
            line = line[1:]
            line = line.strip();
            if line.startswith('x'):
                self.parseVarLine(line)
            elif line.startswith('SID='):
                self.parseLocLine(line)

    def loadClaspOutFile(self, ClaspOutFile):
        for line in ClaspOutFile:
            if not line:
                continue
            if not line.startswith('v'):
                continue
            line = line.strip("v \n")
            for Var in line.split():
                self.Vars.append(self.translateVar(Var))

    def genCoverageReport(self):
        print "============ coverage report ============"
        CondCover = {}
        NumCovered = 0
        NumTotal = 0
        for Var in self.Vars:
            Sgn, DVar = self.decomposeVar(Var)
            if DVar.startswith("cm_"):
                SID = DVar[3:]
                Uuid = self.SID2Uuid[SID]
                NumTotal += 1
                if Sgn:
                    CondCover[Uuid] = True
                    NumCovered += 1
                else:
                    CondCover[Uuid] = False
        for UuidD in self.DOrder:
            print UuidD+" "+self.Uuid2Loc[UuidD].toString()+":"
            for UuidC in self.Uuid2Children[UuidD]:
                msg = "-"+UuidC+" "+self.Uuid2Loc[UuidC].toString()
                if CondCover[UuidC]:
                    msg += " > Covered"
                else:
                    msg += " > Uncovered"
                print msg
        print "SUMMARY: {0}/{1} covered".format(NumCovered, NumTotal)

    def genTestCaseReport(self):
        NumSelected = 0
        NumTotal = 0
        Selected = []
        for Var in self.Vars:
            Sgn, DVar = self.decomposeVar(Var)
            if DVar.startswith("t_"):
                if Sgn:
                    TID = DVar[2:]
                    Selected.append(TID)
                    NumSelected += 1
                NumTotal += 1
        Selected = sorted(Selected)
        print "============ selected test cases ============"
        print ' '.join(Selected)
        print "SUMMARY: {0}/{1} selected".format(NumSelected, NumTotal)

    def genReport(self):
        self.genCoverageReport()
        self.genTestCaseReport()

def run(argv):
    if len(argv) != 2:
        print "USAGE: parse_pbo_out.py <clasp-output-file> <pbo-file>"
        return 1

    ClaspOutFile = open(argv[0], 'r')
    PBOFile = open(argv[1], 'r')
    IM = InfoMgr()
    IM.loadPBOFile(PBOFile)
    IM.loadClaspOutFile(ClaspOutFile)
    IM.genReport()

if __name__ == "__main__":
    run(sys.argv[1:])
