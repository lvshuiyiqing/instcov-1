set(LLVM_LINK_COMPONENTS support)

add_clang_executable(instcov-view
  PrettyDumper.cpp
  InstCovView.cpp
)

target_link_libraries(instcov-view
  instcovBasic
  )
