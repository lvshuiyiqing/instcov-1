set(LLVM_LINK_COMPONENTS support)

add_clang_executable(instcov-view
  DISlotTree.cpp
  DIBuilder4View.cpp
  InstCovView.cpp
  RecordMgr.cpp
)

target_link_libraries(instcov-view
  instcovBasic
  )
