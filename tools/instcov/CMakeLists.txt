set(LLVM_LINK_COMPONENTS support)
set(LLVM_USED_LIBS clangTooling clangBasic)

add_clang_executable(instcov
  DbgInfoMgr.cpp
  InstCov.cpp
  InstCovInstDecisions.cpp
  InstCovInstConditions.cpp
  )
target_link_libraries(instcov
  clangTooling
  clangBasic
  )
