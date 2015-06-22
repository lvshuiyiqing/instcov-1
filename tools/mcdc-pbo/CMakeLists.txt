set(LLVM_LINK_COMPONENTS support)

add_clang_executable(mcdc-pbo
  ProblemGenerator.cpp
  MCDCPBO.cpp
  )

target_link_libraries(mcdc-pbo
  instcovBasic
  )
