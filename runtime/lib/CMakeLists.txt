add_clang_library(instcov_rt
  instcov_rt.cpp
)

set_target_properties(instcov_rt
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib/instcov"
)
