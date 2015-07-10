set(LLVM_LINK_COMPONENTS support)

add_clang_executable(mcdc-scan
  MCDCScan.cpp
  FastAnalyzer.cpp
  SCAnalyzer.cpp
  PBOEmitter.cpp
)

target_link_libraries(mcdc-scan
  instcovBasic
  )
