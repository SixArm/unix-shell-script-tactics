# Unix shell script tactics - best practices style guide

This Unix shell script style guide helps us write better Unix shell script code for speed, security, stability, and portability.

This guide is by SixArm.com, a software consultancy. Our customers use shell scripts within a wide variety of Unix shells, so we aim for POSIX for simple scripts.

Highlights:

  * [Aim for POSIX when possible because of portability and standardization](doc/aim-for-posix/)
  * [Protect scripts by using `set` flags such as `set -euf`](doc/protect-scripts-by-using-set-flags/)
  * [Print output with `printf` not `echo`](doc/print-output-with-printf-not-echo/)
  * [Trap signals and exit by using `trap trap_exit EXIT`](doc/trap-signals-and-exit/)
  * [Use a `main()` function](doc/use-a-main-function/)
  * [Run executable with no file name extension](doc/run-executable-with-no-file-name-extension/)
  * [Source with dot operator `.` not keyword `source`](doc/source-with-dot-operator-not-keyword-source/)
  * [for arg do loop](doc/for-arg-do-loop/)
  * [Parse options via `while…case` not `getopts/getopt`](doc/parse-options-via-while-and-case-not-getopts-or-getopt/)
  * [Version name: use semantic versioning](doc/version-name-use-semantic-versioning/)
  * [Help: use a function and HERE document](doc/help-use-a-function-and-here-document/)
  * [Date &amp; time format: use UTC and ISO8601](doc/date-time-format-use-utc-and-iso8601/)
  * [Booleans: use true and false](doc/booleans-use-true-and-false/)
  * [Subshells: use parentheses `$()` not backticks](doc/subshells-use-parentheses-not-backticks/)
  * [Trace using set -x then set +x without printing](doc/trace-using-set-x-then-set-x-without-printing/)
  * [Use color with terminal escape codes and NO_COLOR](doc/use-color-with-terminal-escape-codes-and-no-color/)
  * [Hunt for bugs by using ShellCheck](https://www.shellcheck.net/)
  * [Fix some bugs automatically, if you want, by using Shellharden](https://github.com/anordal/shellharden/)

Recommendations (details of these are TODO):

  * Quote liberally such as `"$var"` instead of just `$var`, for safety.
  * Bulletproof scripts to handle characters such as a quote, newline, leading dash.
  * Enable a user to customize commands by using env vars such as `${FOO:-foo}`.
  * Create temporary files by using `mktemp` instead of `tempfile` et. al.
  
Demo:

  * [Unix shell script tactics demo](bin/unix-shell-script-tactics-demo/)


## Topics

Argument parsing:

  * [Arg parse](doc/arg-parse/)
  * [Parse options via `while` and `case` not `getopts` or `getopt`](doc/parse-options-via-while-and-case-not-getopts-or-getopt/)

Environment variables:

  * [Test if set or unset](doc/environment-variables/test-if-set-or-unset/)
  * [$FUNCNAME function name](doc/environment-variables/funcname-function-name/)

Directories:

  * [Script directory: use realpath or cd](doc/directories/script-directory-use-realpath-or-cd/)
  * [Log directory: use $LOG_HOME](doc/directories/cache-directory-use-log-home/)
  * [Data directory: use $XDG_DATA_HOME](doc/directories/data-directory-use-xdg-data-home/)
  * [Cache directory: use $XDG_CACHE_HOME](doc/directories/cache-directory-use-xdg-cache-home/)
  * [Configuration directory: use $XDG_CONFIG_HOME](doc/directories/configuration-directory-use-xdg-config-home/)
  * [Runtime directory: use $XDG_RUNTIME_HOME](doc/directories/runtime-directory-use-xdg-runtime-home/)
  * [Temporary directory:: use `mktemp`](doc/directories/temporary-directory-use-mktemp/)

Files:

  * [Temporary file using `mktemp` and `trap`](doc/temporary-file-using-mktemp-and-trap/)
  * [Find files with filter for permission denied](doc/find-files-with-filter-for-permission-denied/)
  * [Find files with special characters](doc/find-files-with-special-characters/)
  * [Find files with readable permissions](doc/find-files-with-readable-permissions/)
  * [Find files with executable, perm, test, exec](doc/find-files-with-executable-perm-test-exec/)

References:

  * [Writing safe shell scripts](https://sipb.mit.edu/doc/safe-shell/)
  * [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html/)
  * [Google Shell Script Style Guide](https://google.github.io/styleguide/shell.xml/)
  * [Filenames and Pathnames in Shell: How to do it Correctly](http://www.dwheeler.com/essays/filenames-in-shell.html/)
  * [Standard Command-Line Options](http://www.tldp.org/LDP/abs/html/standard-options.html/)
  * [How to do things safely in bash](https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md/)
  * [pure sh bible](https://github.com/dylanaraps/pure-sh-bible) & [pure bash bible](https://github.com/dylanaraps/pure-bash-bible/)

Conventions:

  * [Program name using a string or basename](doc/program-name-using-a-string-or-basename/)
  * [Git top level directory using rev-parse](doc/git-top-level-directory-using-rev-parse/)
  * [Functions: out, err, die, big, log, now, sec, zid, cmd, etc.](doc/functions-out-err-die-big-log-now-sec-zid-cmd-etc/)
  * [Assert functions: assert_empty, assert_equal, assert_match](doc/assert-functions/)
  * [sec() function portability](doc/sec-function-portability/)

Control flow statements:

  * [While loop with index counter](doc/while-loop-with-index-counter/)
  * [Do while loop](doc/do-while-loop/)
  * [Case statement that skips option dash flags](doc/case-statement-that-skips-option-dash-flags/)

Functions:

  * [Export function](doc/export-function/)
  * [Number functions](doc/number-functions/)
  * [Array functions](doc/array-functions/)
  * [URL encode](doc/url-encode/)
  * [URL decode](doc/url-decode/)

Command snippets:

  * [awk match_between](doc/awk-match-between/)

Compatibilities:

  * [`readlink` on macOS behaves differently](doc/readlink-on-macos-behaves-differently/)
  * [`realpath` is` not available on older macOS default](doc/realpath-is-not-available-on-older-macos-default/)

PostgreSQL psql:

  * [psql helpers](doc/psql-helpers/)
