# SixArm.com » <br> Shell Style Guide

SixArm is a software consultancy and our clients use a wide range of shells and systems; this is our shell style guide that helps us write better shell scripts for speed, security, stability, and sharability.

Summary:

  * [Aim for POSIX when possible because of portability and standardization](aim-for-posix.md).
  * [Protect scripts by using "set" flags such as `set -euf`](protect-scripts-by-using-set-flags.md).
  * [Trap signals and exit by using `trap "..." EXIT` instead of TERM, INT, HUP, etc.](trap-signals-and-call-exit.md).
  * [Version name: use semantic versioning](version-name-use-semantic-versioning.md).
  * [Help: use a function and HERE document](help-use-a-function-and-here-document.md).
  * [Date &amp; time format: use UTC and ISO8601](date-time-format-use-utc-and-iso8601.md).
  * [Configuration directory: use XDG_CONFIG_HOME](choose-configuration-directory-using-xdg-config-home.md).
  * [Booleans: use true and false](booleans-use-true-and-false.md).
  * [Subshells: use parentheses not backticks](subshells-use-parentheses-not-backticks.md)
  * Quote liberally such as `"$var"` instead of just `$var`, for safety.
  * Bulletproof scripts to handle characters such as a quote, newline, leading dash.
  * Executables should have no extension (strongly preferred).
  * Use `printf` instead of `echo` because of security and stability.
  * Enable a user to customize commands by using env vars such as `${FOO:-foo}`.
  * Run a subshell command by using `$()` instead of backticks.
  * Create temporary files by using `mktemp` instead of `tempfile` et. al.
  * Parse options by using `while` and `case` instead of `getopts` or `getopt`.

General advice:

  * [Writing safe shell scripts](https://sipb.mit.edu/doc/safe-shell/)
  * [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html)
  * [Google Shell Script Style Guide](https://google.github.io/styleguide/shell.xml])
  * [Filenames and Pathnames in Shell: How to do it Correctly](http://www.dwheeler.com/essays/filenames-in-shell.html)
  * [Standard Command-Line Options](http://www.tldp.org/LDP/abs/html/standard-options.html)
  * [How to do things safely in bash](https://github.com/anordal/shellharden/blob/master/how_to_do_things_safely_in_bash.md)

High priority:

  * [Program name using a string or basename](program-name-using-a-string-or-basename.md)
  * [Program directory using pwd and dirname](program-directory-using-pwd-andr-basename.md)
  * [Functions: out, err, die, log, now, sec, zid, cmd, etc.](functions-out-err-die-log-now-sec-zid-cmd-etc.md)
  * [Assert functions: assert_empty, assert_equal, assert_match](assert-functions.md)
  * [sec() function portability](sec-function-portability.md)

Directories and files:

  * [Temporary directory using `mktemp` and `program`](temporary-directory-using-mktemp-and-program.md)
  * [Temporary file using `mktemp` and `trap`](temporary-file-using-mktemp-and-trap.md)
  * [Find files with filter for permission denied](find-files-with-filter-for-permission-denied.md)
  * [Find files with special characters](find-files-with-special-characters.md)
  * [Find files with readable permissions](find-files-with-readable-permissions.md)

Control flow statements:

  * [While loop with index counter](while-loop-with-index-counter.md)
  * [Do while loop](do-while-loop.md)
  * [Case statement that skips option dash flags](case-statement-that-skips-option-dash-flags.md)

Extras:

  * [Export function](export-function.md)
  * [Number functions](number-functions.md)
  * [Array functions](array-functions.md)
  * [URL encode and URL decode](url-encode-and-url-decode.md)


### Sample script


This sample script shows many of our style guide conventions that we tend to use for our public, larger, longer scripts.

    #/bin/sh
    set -euf

    ## Program Tracking ##

    program_command="my-awesome-script"
    program_version="1.0.0"
    program_updated="2016-01-11"
    program_license="GPL"
    program_contact="Alice Adams (alice@example.com)"

    ## Help Function ##

    help(){
    cat << EOF

    My Awesome Script

    Command: $program_command
    Version: $program_version
    Updated: $program_updated
    License: $program_license
    Contact: $program_contact
    EOF
    }

    out() { printf %s\\n "$*" ; }; export -f out
    err() { >&2 printf %s\\n "$*" ; }; export -f err
    die() { >&2 printf %s\\n "$*" ; exit 255 ; }; export -f die
    log() { printf '%s %s %s\n' "$( now )" $$ "$*" ; }; export -f log
    now() { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }; export -f now
    sec() { date "+%s" ; }; export -f sec
    zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }; export -f zid
    cmd() { command -v $1 >/dev/null 2>&1 ; }; export -f cmd

    ## Number helpers
    int() { awk '{ print int($1) }' ; }; export -f int
    sum() { awk '{for(i=1; i<=NF; i++) sum+=$i; } END {print sum}' ; }; export -f sum

    ## Array helpers: array index and array number of fields
    ari() { [ $# == 3 ] && awk -F "$2" "{print \$$3}" <<< "$1" || awk "{print \$$2}" <<< "$1" ; }; export -f ari
    arn() { [ $# == 2 ] && awk -F "$2" "{print NF}"   <<< "$1" || awk "{print NF}"   <<< "$1" ; }; export -f arn

    ## Directory helpers: configuration directory and temporary directory
    config_dir() { out "${XDG_CONFIG_HOME:-$HOME/.config}" ; }; export -f config_dir;
    temp_dir() { out $(mktemp -d -t "${1:-$(zid)}"); }; export -f temp_dir;

    ## Assert helpers
    assert_empty() { [ -z "$1" ]      || err $FUNCNAME "$@" ; }; export -f assert_empty
    assert_equal() { [ "$1" = "$2" ]  || err $FUNCNAME "$@" ; }; export -f assert_equal
    assert_match() { [[ "$2" =~ $1 ]] || err $FUNCNAME "$@" ; }; export -f assert_match

    ## Verify a command executable, a script variable, and an env variable
    CURL=${CURL:-curl}; cmd "$CURL" || die_cmd "$CURL"
    foo="${1:-}"; [ -z "$foo" ] && die_var foo
    [ -z ${BAR+x} ] && die_var BAR

    if [ "$#" -ge 1 ]; then
      case "$1" in
        --help)
          help; exit 0
          ;;
        -v|--version)
          out $program_version; exit 0
          ;;
        --config-dir)
          out $(config_dir); exit 0
          ;;
        --temp-dir)
          out $(temp_dir); exit 0
          ;;
      esac
    fi

    # The program's typcial main source code starts here
