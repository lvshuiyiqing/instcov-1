# InstCov README

## Introduction InstCov is a Clang-based instrumentation tool for branch
coverage and MCDC coverage recording.

## Basic Usage To use the tool, you need to follow these steps:

1. Preprocess your original source code using `-E` option in the compiler.
Plus, please also use `-include instcov_rt.h` and proper `-I` option to make the
compiler include the InstCov runtime header first.

2. Convert your original source code into an intermediate form using
instcov. The code will be injected with profiling code:

	`<path-to-instcov>/instcov [args] <your-source-file> --
	[clang [compilation args]]`

	For the default option, only branch coverage recording is enabled.  If you
	want to enable MCDC coverage recording, please add `-inst-conditions`. (You
	can check the help messages using `instcov --help`.)

	After the running this command, a `.dbginfo` file will generated for each
	file, containing the debug information for later analysis.

3. Build the instrumented code by explicitly linking your program with
`libinstcov_rt.a`. Then your program should be instrumented.

4. After you run your program, the trace file will be written into
`instcov.dump`. You can change the file name by setting environment variable
`INSTCOV_FILE`.

	The trace file will be written in binary mode by default. Also, the trace
	file could be written in text mode. You need to set environment variable
	`INSTCOV_TEXT_MODE` to `TRUE` or `YES` to enable text mode.

5. Run the analysis tool `instcov-view` to analyse the trace file:

	`<path-to-instcov-view>/instcov-view <instcov.dump> [.dbginfo files ...]`

	Note that only binary dump format is supported for analysis.



## Using the scripts Alternatively, you can use the wrapper scripts shipped with
this package. [[ You need to customize the directories in the scripts before using
them. ]] The descriptions for the scripts are as follows:

* `prep.sh`: the preprocessor wrapper, it preprocesses the given files,
including the InstCov runtime header, and dumps `<file>.<extension>` to
`<file>.i.<extension>`.

* `instcov.sh`: it's just a redirection of instcov, if you don't want to modify
your PATH environment;

* `ccwraper.sh`: a wrapper for compiling the transformed code. It will
automatically add options to the linker, so as to link with the InstCov runtime
library.

* `instcov-view.sh`: it is just a wrapper for instcov-view.

