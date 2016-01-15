# SixArm.com » <br> Shell Style Guide

General advice:

  * [Writing safe shell scripts](https://sipb.mit.edu/doc/safe-shell/)
  * [Rich’s sh (POSIX shell) tricks](http://www.etalabs.net/sh_tricks.html)
  * [Google Shell Script Style Guide](https://google.github.io/styleguide/shell.xml])

Our advice:

  * Use POSIX when possible because it is portable.
  * Quote liberally such as `"$var"` instead of just `$var`, for safety.
  * Bulletproof for characters such as quote, newline, leading dash, etc.
  * Prefer dates and times using UTC and formatted using ISO standards.
  * Executables should have no extension (strongly preferred).
  * Use `printf` instead of `echo` because of security and stability.
  * Use `$()` instead of backticks for subshell commands.
  * Use `mktemp` instead of `tempfile`, and instead of ad hoc $$, RANDOM, etc.
  * Use `trap "..." EXIT` instead of TERM, INT, HUP, etc.


### Set flags

For POSIX scripts, please start with:

    set -euf

For bash/zsh scripts, please start with:

    set -euf -o pipefail


### Help function

For scripts that provide help, please create a help function:

    help(){
    cat << EOF
    ... help text here ...
    EOF
    }


### Help metadata

For help metadata, please include this information:

    Version: 1.0.0
    Created: 2016-01-14
    Updated: 2016-01-15
    License: GPL
    Contact: Your Name (you@example.com)


### General purpose functions

Our scripts may use these general purpose functions:

  * `out()` is for output messages; it prints to STDOUT.
  * `err()` is for error messages; it prints to STDERR.
  * `log()` calls `out()` prepending a time stamp and PID.
  * `now()` is a timestamp uses UTC and ISO 8601:2004.
  * `zid()` is a 128-bit secure random hex lowercase ID.

Source:

    out () { printf %s\\n "$*" ; }
    err () { >&2 printf %s\\n "$*" ; }
    log () { printf '%s %s %s\n' $( now ) $$ "$*" ; }
    now () { date -u "+%Y-%m-%dT%H:%M:%S,%NZ" ; }
    zid () { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random }


### Sample script

Sample script that combines all the above:

    #/bin/sh
    set -euf
    help(){
    cat << EOF

    Foo: this script does foo stuff.

    Version: 1.0.0
    Created: 2016-01-14
    Updated: 2016-01-15
    License: GPL
    Contact: Your Name (you@example.com)
    EOF
    }

    out () { printf %s\\n "$*" ; }
    err () { >&2 printf %s\\n "$*" ; }
    log () { printf '%s %s %s\n' $( now ) $$ "$*" ; }
    now () { date -u "+%Y-%m-%dT%H:%M:%S,%NZ" ; }
    zid () { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random }

    # Main source code goes here
