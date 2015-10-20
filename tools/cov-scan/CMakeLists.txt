set(LLVM_LINK_COMPONENTS support)

add_clang_executable(cov-scan
  CovScan.cpp
  DCAnalyzer.cpp
  FuncAnalyzer.cpp
  MCDCAnalyzerSC.cpp
  PBOProblem.cpp
  PBOEmitter.cpp
)

target_link_libraries(cov-scan
  instcovBasic
  )
