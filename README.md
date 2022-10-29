# Unix shell script tactics - best practices style guide

This Unix shell script style guide helps us write better Unix shell script code for speed, security, stability, and portability. 

This guide is by SixArm.com, a software consultancy. Our customers use shell scripts within a wide variety of Unix shells, so we aim for POSIX for simple scripts.

Highlights:

  * [Aim for POSIX when possible because of portability and standardization](doc/aim-for-posix.md)
  * [Protect scripts by using `set` flags such as `set -euf`](doc/protect-scripts-by-using-set-flags.md)
  * [Print output with `printf` not `echo`](doc/print-output-with-printf-not-echo.md)
  * [Trap signals and exit by using `trap trap_exit EXIT`](doc/trap-signals-and-exit.md)
  * [Run executable with no file name extension](doc/run-executable-with-no-file-name-extension.md)
  * [Source with dot operator `.` not keyword `source`](doc/source-with-dot-operator-not-keyword-source.md)
  * [Parse options via `while` and `case` not `getopts` or `getopt`](doc/parse-options-via-while-and-case-not-getopts-or-getopt.md)
  * [Version name: use semantic versioning](doc/version-name-use-semantic-versioning.md)
  * [Help: use a function and HERE document](doc/help-use-a-function-and-here-document.md)
  * [Date &amp; time format: use UTC and ISO8601](doc/date-time-format-use-utc-and-iso8601.md)
  * [Booleans: use true and false](doc/booleans-use-true-and-false.md)
  * [Subshells: use parentheses `$()` not backticks](doc/subshells-use-parentheses-not-backticks.md)
  * [`readlink` on macOS behaves differently](doc/readlink-on-macos-behaves-differently.md)
  * [Hunt for bugs by using ShellCheck](https://www.shellcheck.net)
  * [Fix some bugs automatically, if you want, by using Shellharden](https://github.com/anordal/shellharden)    


Recommendations (details of these are TODO):

  * Quote liberally such as `"$var"` instead of just `$var`, for safety.
  * Bulletproof scripts to handle characters such as a quote, newline, leading dash.
  * Enable a user to customize commands by using env vars such as `${FOO:-foo}`.
  * Create temporary files by using `mktemp` instead of `tempfile` et. al.
  
Demo:

  * [Unix shell script tactics demo](bin/unix-shell-script-tactics-demo)


## Topics

Argumemt parsing:

  * [Arg parse](doc/arg-parse.md)
  * [Parse options via `while` and `case` not `getopts` or `getopt`](doc/parse-options-via-while-and-case-not-getopts-or-getopt.md)

Environment variables:

  * [Test if set or unset](doc/environment-variables/test-if-set-or-unset.md)
  * [$FUNCNAME function name](doc/environment-variables/funcname-function-name.md)

Directories:

  * [Script directory](doc/directories/script-directory.md)
  * [Log directory: use $LOG_HOME](doc/directories/cache-directory-use-log-home.md)
  * [Data directory: use $XDG_DATA_HOME](doc/directories/data-directory-use-xdg-data-home.md)
  * [Cache directory: use $XDG_CACHE_HOME](doc/directories/cache-directory-use-xdg-cache-home.md)
  * [Configuration directory: use $XDG_CONFIG_HOME](doc/directories/configuration-directory-use-xdg-config-home.md)
  * [Runtime directory: use $XDG_RUNTIME_HOME](doc/directories/runtime-directory-use-xdg-runtime-home.md)
  * [Temporary directory:: use `mktemp`](doc/directories/temporary-directory-use-mktemp.md)

Files:

  * [Temporary file using `mktemp` and `trap`](doc/temporary-file-using-mktemp-and-trap.md)
  * [Find files with filter for permission denied](doc/find-files-with-filter-for-permission-denied.md)
  * [Find files with special characters](doc/find-files-with-special-characters.md)
  * [Find files with readable permissions](doc/find-files-with-readable-permissions.md)
  * [Find files with executable, perm, test, exec](doc/find-files-with-executable-perm-test-exec.md)

References:

  * [Writing safe shell scripts](https://sipb.mit.edu/doc/safe-shell/)
  * [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html)
  * [Google Shell Script Style Guide](https://google.github.io/styleguide/shell.xml)
  * [Filenames and Pathnames in Shell: How to do it Correctly](http://www.dwheeler.com/essays/filenames-in-shell.html)
  * [Standard Command-Line Options](http://www.tldp.org/LDP/abs/html/standard-options.html)
  * [How to do things safely in bash](https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md)
  * [pure sh bible](https://github.com/dylanaraps/pure-sh-bible) & [pure bash bible](https://github.com/dylanaraps/pure-bash-bible)

Conventions:

  * [Program name using a string or basename](doc/program-name-using-a-string-or-basename.md)
  * [Program directory using pwd and dirname](doc/program-directory-using-pwd-andr-basename.md)
  * [Functions: out, err, die, big, log, now, sec, zid, cmd, etc.](doc/functions-out-err-die-big-log-now-sec-zid-cmd-etc.md)
  * [Assert functions: assert_empty, assert_equal, assert_match](doc/assert-functions.md)
  * [sec() function portability](doc/sec-function-portability.md)

Control flow statements:

  * [While loop with index counter](doc/while-loop-with-index-counter.md)
  * [Do while loop](doc/do-while-loop.md)
  * [Case statement that skips option dash flags](doc/case-statement-that-skips-option-dash-flags.md)

Functions:

  * [Export function](doc/export-function.md)
  * [Number functions](doc/number-functions.md)
  * [Array functions](doc/array-functions.md)
  * [URL encode and URL decode](doc/url-encode-and-url-decode.md)

PostgreSQL psql:

  * [psql helpers](doc/psql-helpers.md)
  
