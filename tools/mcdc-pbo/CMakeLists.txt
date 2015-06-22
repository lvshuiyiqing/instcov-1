set(LLVM_LINK_COMPONENTS support)

add_clang_executable(mcdc-pbo
  MCDCPBO.cpp
)

target_link_libraries(mcdc-pbo
  instcovBasic
  )
