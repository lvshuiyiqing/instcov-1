# InstCov Internal Implementations

The internal Implementation of InstCov is based on Clang.  InstCov operates on
Clang AST. It recursively traverses the AST, and when a conditional statement
node is visited, it instruments necessary recording code into the original
source code using clang::Rewriter.

The current implementation works with Clang 3.6.

## Implementation Choices Theoretically, there are three possible implementation
strategies:

* Source-to-source transformation, which means to insert new text into the
original source code;

* AST-level instrumentation, which means to modify the AST to add new recoding
AST nodes;

* CFG-level instrumentation, which means to insert new statements or basic
blocks into the CFG. Note that in this solution, the CFG might have broken a
conditional statment into multiple basic blocks with conditional
jumps. Therefore it may be hard to align the CFG-level jumps with the
source-level conditional statements.

We choose the first strategy in InstCov, since libclang does not recommend users
to modify the AST (it is not safe and may cause serious problems), and clang CFG
does not have information to map the BB branches back to the source code
(ref. Zhenbo Xu).

## Important Clang classes/methods used

In our implementation, the following clang classes/methods are very important:

* `ClangTool`: this is used when creating a standalone tool based on libclang;

* `RecursiveASTVisitor`: an infrastructore in libclang, which provides a
  mechanism to visit the AST tree recursively;

* `Rewriter`: a class provided by libclang, which is used to insert text into
  the original source code;

* `Stmt`: class for statements in clang;

* `Expr`: class for expressions in clang, inherited from `Stmt`;

* `getLocStart()`: a method to get the starting location of the first token in a
  `Stmt` or `Expr`;

* `getLocEnd()`: a method to get the starting location of the last token in a
  `Stmt` or `Expr`, usually used with `Lexer::getLocForEndOfToken()`;

* `dumpPretty()`: this method is used to dump an `Stmt` into the original source
language.

* `PresumedLoc`: the original source location, which is computed using the
  `#line` directives.


A notable thing is that, when using `getLocEnd()`, the returned `SourceLocation`
might not always be the last location of a statemenet. If the statement
terminates with right brace `}`, then the location will be fine. However if a
statement terminates with semicolon `;`, then `getLocEnd()` will return the
beginning of the token before `;`. This is not a desired behavior, so we need to
use `clang::Lexer` to search backwards to find a `;` token. This may be awkward,
but it seems to be the only way.

## What is Instrumented?

We need to dump corresponding record into a log file when some point is
visited. We need to assign each recording point a unique number for
identification. We are planning to assign each conditional statement and each
expression a unique id. (This feature is currently not implemented)

What is actually instrumented into the source code is a `instcov_dump()`
function calling the InstCov runtime library to log corresponding records.

### `if` statement

Since `if` statement allows variable declaration in the condition, we'd better
not modify the condition.

We have identified several patterns of `if` statement, and tackle each of them:

* If the `then` or `else` branch is a single statement (i.e. terminating with
`;`), we surround the statement with braces `{}` and add a `instcov_dump()` call
just before the statement;

* If the `then` branch is a compound statement (i.e. surrounded with `{}`), we
just insert a `instcov_dump()` after `{`;

* If the `else` branch is missing, we add

		else instcov_dump();

  just after the then block.


### `while` statement

Since `while` statement allows variable declaration in the condition, we'd
better not modify the condition.

We have identified several patterns of `while` statement, and tackle each of
them:

* If the loop body is a single statement (i.e. terminating with `;`), we
surround the statement with braces `{}` and add a `instcov_dump()` call just
before the statement;

* If the loop body is a compound statement (i.e. surrounded with `{}`), we just
insert a `instcov_dump()` after `{`;

* We insert a `instcov_dump()` call just after the loop body to record that the
loop condition is evaluated to false.

### `for` statement

The treatment for `for` statements are exactly the same with `while` statement.

### `do` statement

The treatment for `do` statements is a little bit tricky. The reason why it is
different is that the first iteration is unconditional, and no record should be
logged.

To instrument a `do` statement we surround the loop condition with parentheses
`()`, and change it into a tenary operator. Suppose the original form is:

	do { } while (cond);

The instrumented code will be (we use `0` and `1` for C-compatibility):

	do { } while ((cond) ? (instcov_dump(), 1) : (instcov_dump(), 0));

### `switch` statement

`switch` statement recording is currently not supported in InstCov.

### MC/DC instrumentation

For recording MC/DC coverage, we need to record the evaluation of conditions in
each decision (`if/for/while/do` statement).  Note that the evaluation of
logical expressions has the short-circuit symptom. Thus some conditions may not
be evaluated. However, for MC/DC recording, we need to record each condition of
the decision.  In InstCov, we collect all the atomic expressions, and dump their
evaluation result before the decision is evaluated. A consequence of this
treatment is that some condition may be evaluated twice. If some conditions has
side effects (such as `++a > 0`), then the instrumented code will have different
behavior with the original one.

Suppose the original condition expression in the conditional statement is
`cond`, which has decisions `a`, `b` and `c`. The trasformed condition
expression will be:

`(a) ? instcov_dump() : instcov_dump(), (b) ? instcov_dump() :
instcov_dump(), (c) ? instcov_dump() : instcov_dump(), expr`

## About the `dump` function

Here we give each program entity (decisions & conditions) a UUID (128-bit
unsigned integer). The `dump` function is declared as follows:

    #ifdef __cplusplus
    extern "C" {
    #endif  // __cplusplus
    void dump(uint64_t uuid_high, uint64_t uuid_low, uint64_t bid);
    #ifdef __cplusplus
    }
    #endif  // __cplusplus

Here `bid` is the branch id. We use `1` for the true branch and `0` for the
false branch.

Before dumping the trace, a magic string is inserted first for file type
recognition. All dumping is aligned by the size of `uint64_t`.

## About the `dbginfo`

The debug information contains the UUID of this entity, the UUID of the
parent entity, the file name, the line number and the column number. 

Before dumping the debug information, a magic string is inserted first for file
type recognition. All dumping is aligned by the size of `uint64_t`.
