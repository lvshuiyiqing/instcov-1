set(LLVM_LINK_COMPONENTS support)

add_clang_executable(instcov-view
  DISlotTree.cpp
  DbgInfoDB.cpp
  InstCovView.cpp
  RecordMgr.cpp
)
