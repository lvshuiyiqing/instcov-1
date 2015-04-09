# InstCov README

## Introduction
InstCov is a Clang-based instrumentation tool for branch coverage and
MCDC coverage recording.

## Basic Usage
To use the tool, you need to follow these steps:

1. Convert your original source code into an intermediate form using
instcov. The code will be injected with profiling code:

  ```
  <path-to-instcov>/instcov <your-source-file> [other compilation
  args] --
  ```
  **(Note the terminating double dashes)**

  For the default option, only branch coverage recording is enabled.
  If you want to enable MCDC coverage recording, please check the help
  messages using `instcov --help`.

2. Build the instrumented code by explicitly including `instcov_rt.h`
during the compiling process, and explicitly linking your program with
`libinstcov_rt.a`.

Then all should be fine. After you run your program, the trace file
will be written into `instcov.dump`. You can change the file name by
setting environment variable `INSTCOV_FILE`.

Also, the trace file could be written in binary mode. You need to set
environment variable `INSTCOV_BINARY_MODE` to `TRUE` or `YES` to
enable binary mode.

## Using the scripts
Alternatively, you can use the wrapper scripts shipped with this
package. You need to customize the directories in the scripts before
using them. The descriptions for the scripts are as follows:

* `instcov.sh`: it's just a redirection of instcov, if you don't want to
modify your PATH environment;

* `ccwraper.sh`: a wrapper for compiling the transformed code. It will
automatically add "-include" and "-l" options to the compiler and
linker.

