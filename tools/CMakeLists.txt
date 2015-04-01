set(LLVM_LINK_COMPONENTS support)
set(LLVM_USED_LIBS clangTooling clangBasic)

add_clang_executable(instcov
  InstCov.cpp
  InstCovASTVisitor.cpp
  )
target_link_libraries(instcov
  clangTooling
  clangBasic
  )
