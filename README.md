# SixArm.com » <br> Shell Style Guide

General advice:

  * [Writing safe shell scripts](https://sipb.mit.edu/doc/safe-shell/)
  * [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html)
  * [Google Shell Script Style Guide](https://google.github.io/styleguide/shell.xml])
  * [Filenames and Pathnames in Shell: How to do it Correctly](http://www.dwheeler.com/essays/filenames-in-shell.html)
  * [Standard Command-Line Options](http://www.tldp.org/LDP/abs/html/standard-options.html)

Summary:

  * Use POSIX whenever possible because POSIX is portable.
  * Set shell script flags to protect the script such as `set -euf`.
  * Quote liberally such as `"$var"` instead of just `$var`, for safety.
  * Bulletproof to handle characters such as a quote, newline, leading dash.
  * Executables should have no extension (strongly preferred).
  * Use `printf` instead of `echo` because of security and stability.
  * Enable a user to customize commands by using env vars such as `${FOO:-foo}`.
  * To format a date and time: use UTC and using ISO8601 standards.
  * To format a time, use nanoseconds; note these won't work on default BSD.
  * To run a subshell command: use `$()` instead of backticks.
  * To create temporary files: use `mktemp` instead of `tempfile` et. al.
  * To trap: use `trap "..." EXIT` instead of TERM, INT, HUP, etc.
  * To parse options: use `while` and `case` instead of `getopts` or `getopt`.
  * To access a user's configuration directory: `${XDG_CONFIG_HOME:-$HOME/.config}`

Highest priority:

  * [Safer scripts using `set` flags](safer-scripts-using-set-flags.md)
  * [Trap exit](trap-exit.md)
  * [Program name using a string or basename](program-name-using-a-string-or-basename.md)
  * [Program directory using pwd and dirname](program-directory-using-pwd-andr-basename.md)
  * [Version name using semantic versioning](version-name-using-semantic-versioning.md)
  * [Help function using here document and metadata](help-function-using-here-document-and-metadata.md)
  * [Booleans using true and false](booleans-using-true-and-false.md)
  * [Date &amp; time format using UTC and ISO8601](date-time-format-using-utc-and-iso8601.md)
  * [Functions: out, err, die, log, now, sec, zid, cmd, etc.](functions-out-err-die-log-now-sec-zid-cmd-etc.md)
  * [sec() function portability](sec-function-portability.md)

Directories and files:

  * [Configuration directory using XDG_CONFIG_HOME](configuration-directory-using-xdg-config-home.md)
  * [Temporary directory using `mktemp` and `program`](temporary-directory-using-mktemp-and-program.md)
  * [Temporary file using `mktemp` and `trap`](temporary-file-using-mktemp-and-trap.md)
  * [Find files with filter for permission denied](find-files-with-filter-for-permission-denied.md)
  * [Find files with special characters](find-files-with-special-characters.md)
  * [Find files with readable permissions](find-files-with-readable-permissions.md)

Control flow statements:

  * [While loop with index counter](while-loop-with-index-counter.md)
  * [Do while loop](do-while-loop.md)
  * [Case statement that skips option dash flags](case-statement-that-skips-option-dash-flags.md)
  * [Subshell syntax using parentheses not backticks](subshell-syntax-using-parentheses-not-backticks.md)

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
        --conf-dir)
          out $(conf_dir); exit 0
          ;;
        --temp-dir)
          out $(temp_dir); exit 0
          ;;
      esac
    fi

    # The program's typcial main source code starts here
