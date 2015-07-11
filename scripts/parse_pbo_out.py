#!/usr/bin/env python
import sys

def parseVarLine(line):
    fields = line.split(": ")
    return fields[0], fields[1]

def parseLocLine(line):
    fields = line.split(": ")
    SID = fields[0].replace("SID=", "", 1)
    LocInfo = fields[1]
    return SID, LocInfo
    
def translate(Dict, Var):
    Neg = (Var[0] == '-')
    Var = Dict[Var.lstrip('-')]
    Res = ''
    if Neg:
        Res += '-'
    Res += Var
    return Res

def decomposeVar(Var):
    Sgn = (Var[0] != '-')
    DVar = Var.lstrip('-')
    return Sgn, DVar
    
def run(argv):
    if len(argv) != 2:
        print "USAGE: parse_pbo_out.py <clasp-output-file> <pbo-info-file>"
        return 1
    
    ClaspOutFile = open(argv[0], 'r')
    InfoFile = open(argv[1], 'r')

    VarDict = {}
    SIDDict = {}
    for line in InfoFile:
        line = line.rstrip();
        if not line:
            continue;
        if line[0] == 'x':
            Var, Str = parseVarLine(line)
            VarDict[Var] = Str
        elif line[0] == 'S':
            SID, LocInfo = parseLocLine(line)
            SIDDict[SID] = LocInfo
        else:
            print "unrecognized info line"
            return 1

    Vars = []
    for line in ClaspOutFile:
        if not line:
            continue
        if line[0] != 'v':
            continue
        line = line.strip("v \n")
        for Var in line.split():
            Vars.append(Var)

    Vars = [ translate(VarDict, Var) for Var in Vars ]
    # dump the parsed PBVars
    print '\n'.join(Vars)
    # dump the matched conditions
    print "MC/DC coverage:"
    NumCovered = 0
    NumUncovered = 0
    for Var in Vars:
        Sgn, DVar = decomposeVar(Var)
        if DVar[0:3] == "cm_":
            SID = DVar[3:]
            sys.stdout.write(SIDDict[SID])
            if Sgn:
                NumCovered += 1
                print " > Covered"
            else:
                NumUncovered += 1
                print " > Uncovered"

    print '{0}/{1} covered'.format(NumCovered, NumCovered+NumUncovered)
    # dump the selected tests
    print "selected test cases:"
    for Var in Vars:
        Sgn, DVar = decomposeVar(Var)
        if (DVar[0:2] == "t_" and Sgn):
            print DVar.replace("t_", "")

if __name__ == "__main__":
    run(sys.argv[1:])
