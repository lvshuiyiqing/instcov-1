set(LLVM_LINK_COMPONENTS support)
set(LLVM_USED_LIBS clangTooling clangBasic)

add_clang_executable(instcov
  InstCov.cpp
  InstCovInstDecisions.cpp
  InstCovInstConditions.cpp
  DIBuilder4Inst.cpp
  )
target_link_libraries(instcov
  clangTooling
  clangBasic
  instcovBasic
  )

if (WIN32)
  target_link_libraries(instcov
    Rpcrt4
    )
endif()

if (NOT APPLE AND NOT WIN32)
  target_link_libraries(instcov
    uuid
    )
endif()

