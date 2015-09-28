set(LLVM_LINK_COMPONENTS support)

add_clang_executable(dc-view
  DIBuilder4View.cpp
  DCView.cpp
)

target_link_libraries(dc-view
  instcovBasic
  )
