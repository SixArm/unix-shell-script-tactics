# All-purpose functions: out, err, log, cmd, now, sec, zid

Our scripts may use these all-purpose functions:

  * `out()` is for output messages; it prints to STDOUT.
  * `err()` is for error messages; it prints to STDERR.
  * `die()` is for fatal messages; it prints to STDERR then does exit 1.
  * `log()` call `out()` prepending a time stamp and PID.
  * `now()` return a timestamp using UTC and ISO 8601:2004.
  * `sec()` return a timestamp using UTC and Unix epoch second.
  * `zid()` return a 128-bit secure random hex lowercase ID.
  * `cmd()` return a path to the default runnable command in $1.
  * `die_cmd_unk()` die because a command is unknown.
  * `die_opt_unk()` die because an option is unknown.
  * `die_opt_arg()` die because an option is missing its argument.
  
Code:

    out() { printf %s\\n "$*" ; }
    err() { >&2 printf %s\\n "$*" ; }
    log() { printf '%s %s %s\n' "$( now )" $$ "$*" ; }
    now() { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }
    sec() { date -u "+%s" }
    zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }
    cmd() { command -v $1 >/dev/null 2>&1 ; }
    die() { >&2 printf %s\\n "$*" ; exit 1 ; }
    die_cmd_unk() { die "Command $1 is unknown" ; }
    die_opt_unk() { die "Option $1 is unknown" ; }
    die_opt_arg() { die "Option $1 needs an argument" ; }

Caveats:

  * If you use `sec()` on many platforms, then see [sec() function portability](sec-function-portability.md)
