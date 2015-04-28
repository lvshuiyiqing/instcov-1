# InstCov README

## Introduction

InstCov is a Clang-based instrumentation tool for branch coverage and MCDC
coverage recording.

## Basic Usage

To use the tool, you need to follow these steps:

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

	The analyzed trace will be written in an output file (the name is
	`parsed_trace.pt` by default). You can also customize the dump format by
	using argument `-f`. Note that only binary dump format is supported for
	analysis.



## Using the scripts

Alternatively, you can use the wrapper scripts shipped with this package. **You
need to customize the directories in script `instcov_env` before using them.**
The descriptions for the scripts are as follows:

* `prep.sh`: the preprocessor wrapper, it preprocesses the given files,
including the InstCov runtime header, and dumps `<file>.<extension>` to
`<file>.i.<extension>`.

* `instcov.sh`: it's just a redirection of instcov, if you don't want to modify
your PATH environment;

* `ccwraper.sh`: a wrapper for compiling the transformed code. It will
automatically add options to the linker, so as to link with the InstCov runtime
library.

* `instcov-view.sh`: it is just a wrapper for instcov-view.

* `run_single_file.sh`: it is a script for running all needed steps for
experimenting on a single program. You can specify command line arguments for
executing the subject program.

## An example output

We have successfully run InstCov on some small programs, as well as some larger
programs such as `tcas` and `replace`. Here are several examples.

* A toy example:

	The source code:

		int main(void) {
			for (int i = 0; i < 2; ++i) {
				int a = 1, b = 2;
				if (a < b && a > b) {
				}
				if ((a > b) || (a < b)) {
				}
			}
			return 0;
		}
			
	The analyzed trace (the format is `<condition/decision id>:<branch id>
    (<line>:<col>:<file>)`)

		2:1 (2:3:testexpr_loop.cpp)
		--1:1 (2:19:testexpr_loop.cpp)
		4:0 (4:5:testexpr_loop.cpp)
		--3:1 (4:9:testexpr_loop.cpp)
		--5:0 (4:18:testexpr_loop.cpp)
		7:1 (6:5:testexpr_loop.cpp)
		--6:0 (6:9:testexpr_loop.cpp)
		--8:1 (6:20:testexpr_loop.cpp)
		2:1 (2:3:testexpr_loop.cpp)
		--1:1 (2:19:testexpr_loop.cpp)
		4:0 (4:5:testexpr_loop.cpp)
		--3:1 (4:9:testexpr_loop.cpp)
		--5:0 (4:18:testexpr_loop.cpp)
		7:1 (6:5:testexpr_loop.cpp)
		--6:0 (6:9:testexpr_loop.cpp)
		--8:1 (6:20:testexpr_loop.cpp)
		2:0 (2:3:testexpr_loop.cpp)
		--1:0 (2:19:testexpr_loop.cpp)

* `tcas`

		19:0 (148:5:tcas.c)
		--18:0 (148:8:tcas.c)
		9:1 (124:5:tcas.c)
		--8:1 (124:9:tcas.c)
		--10:1 (124:20:tcas.c)
		5:1 (73:5:tcas.c)
		--4:1 (73:9:tcas.c)
		7:1 (91:5:tcas.c)
		--6:1 (91:9:tcas.c)
		12:0 (128:2:tcas.c)
		--11:0 (128:6:tcas.c)
		--13:0 (128:24:tcas.c)
		15:0 (133:7:tcas.c)
		--14:0 (133:11:tcas.c)
		17:0 (135:7:tcas.c)
		--16:0 (135:11:tcas.c)

* `replace`

		128:0 (527:4:replace.c)
		--127:0 (527:8:replace.c)
		35:1 (203:5:replace.c)
		--34:1 (203:12:replace.c)
		--36:1 (203:23:replace.c)
		--37:1 (203:44:replace.c)
		39:0 (205:2:replace.c)
		--38:0 (205:6:replace.c)
		41:0 (207:7:replace.c)
		--40:0 (207:11:replace.c)
		--42:1 (207:30:replace.c)
		...
		95:0 (427:5:replace.c)
		--94:0 (427:12:replace.c)
		--96:1 (427:23:replace.c)
		120:0 (494:6:replace.c)
		--119:0 (494:10:replace.c)
		--121:1 (494:22:replace.c)
		123:1 (498:6:replace.c)
		--122:1 (498:10:replace.c)
		--124:0 (498:23:replace.c)
		118:0 (491:2:replace.c)
		--117:0 (491:9:replace.c)
		126:0 (514:5:replace.c)
		--125:0 (514:12:replace.c)
