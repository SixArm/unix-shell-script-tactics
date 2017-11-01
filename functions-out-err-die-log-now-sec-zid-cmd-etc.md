# Functions: out, err, die, log, now, sec, zid, cmd, etc.

Our scripts may use these all-purpose functions:

  * `out` is for output messages; it prints to STDOUT.
  * `err` is for error messages; it prints to STDERR.
  * `die` is for fatal messages; it prints to STDERR then does exit 1.
  * `log` call `out()` prepending a time stamp and PID.
  * `now` return a timestamp using UTC and ISO 8601:2004.
  * `sec` return a timestamp using UTC and Unix epoch second.
  * `zid` return a 128-bit secure random hex lowercase ID.
  * `cmd` return a path to the default runnable command in $1.
  
Code:

    out() { printf %s\\n "$*" ; }; export -f out
    err() { >&2 printf %s\\n "$*" ; }; export -f err
    die() { >&2 printf %s\\n "$*" ; exit 1 ; }; export -f die
    log() { printf '%s %s %s\n' "$( now )" $$ "$*" ; }; export -f log 
    now() { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }; export -f now
    sec() { date -u "+%s" ; }; export -f sec
    zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }; export -f zid
    cmd() { command -v $1 >/dev/null 2>&1 ; }; export -f cmd

Caveats:

  * If you use `sec()` on many platforms, then see [sec() function portability](sec-function-portability.md)
