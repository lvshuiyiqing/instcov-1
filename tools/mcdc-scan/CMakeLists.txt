set(LLVM_LINK_COMPONENTS support)

add_clang_executable(mcdc-scan
  LogMgr.cpp
  MCDCScan.cpp
  FastAnalyzer.cpp
  SCAnalyzer.cpp
)
