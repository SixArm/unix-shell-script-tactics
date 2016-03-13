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
  * To format dates and times: use UTC and using ISO8601 standards.
  * To run a subshell command: use `$()` instead of backticks.
  * To create temporary files: use `mktemp` instead of `tempfile` et. al.
  * To trap: use `trap "..." EXIT` instead of TERM, INT, HUP, etc.
  * To parse options: use `while` and `case` instead of `getopts` or `getopt`.
  * To access a user's configuration directory: `${XDG_CONFIG_HOME:-$HOME/.config}`

Highest priority:

  * [Safer scripts using `set` flags](safer-scripts-using-set-flags.md)
  * [Program name using a string or basename](program-name-using-a-string-or-basename.md)
  * [Version name using semantic versioning](version-name-using-semantic-versioning.md)
  * [Help function using here document and metadata](help-function-using-here-document-and-metadata.md)
  * [Booleans using true and false](booleans-using-true-and-false.md)
  * [Date &amp; time format using UTC and ISO8601](date-time-format-using-utc-and-iso8601.md)
  * [All-purpose functions: out, err, die, log, now, zid](all-purpose-functions-out-err-die-log-now-zid.md)

Directories and files:

  * [Configuration directory using XDG_CONFIG_HOME](configuration-directory-using-xdg-config-home.md)
  * [Temporary directory using `mktemp` and `program`](temporary-directory-using-mktemp-and-program.md)
  * [Temporary file using `mktemp` and `trap`](temporary-file-using-mktemp-and-trap.md)
  * [Find files with special characters](find-files-with-special-characters.md)

Control flow statements:

  * [While loop with index counter](while-loop-with-index-counter.md)
  * [Do while loop](do-while-loop.md)
  * [Case statement that skips option dash flags](case-statement-that-skips-option-dash-flags.md)
  * [Subshell syntax using parentheses not backticks](subshell-syntax-using-parentheses-not-backticks.md)


### Sample script

This sample script shows many of our style guide conventions that we tend to use for our public, larger, longer scripts.

    #/bin/sh
    set -euf
    help(){
    cat << EOF

    Foo Goo: this script does foo stuff.

    Program: your-program-name-here
    Version: 1.0.0
    Created: 2016-01-14
    Updated: 2016-01-15
    License: GPL
    Contact: Your Name Here (you@example.com)
    EOF
    }

    out() { printf %s\\n "$*" ; }
    err() { >&2 printf %s\\n "$*" ; }
    die() { >&2 printf %s\\n "$*" ; exit 1 ; }
    log() { printf '%s %s %s\n' $( now ) $$ "$*" ; }
    now() { date -u "+%Y-%m-%dT%H:%M:%S,%NZ" ; }
    zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }

    program() { echo "foo-goo"; }
    version() { echo "1.2.3"; }
    confdir() { echo ${XDG_CONFIG_HOME:-$HOME/.config}; }
    tempdir() { echo $(mktemp -d -t $program); }

    if [ "$#" -eq 1 ]; then
      case "$1" in
        --help)
          help && exit 0
          ;;
        --program)
          program && exit 0
          ;;
        --version)
          version && exit 0
          ;;
        --confdir)
          confdir && exit 0
          ;;
        --tempdir)
          tempdir && exit 0
          ;;
      esac
    fi

    # The program's main source code starts here
