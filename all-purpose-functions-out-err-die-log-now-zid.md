# All-purpose functions: out, err, log, now, zid

Our scripts may use these all-purpose functions:

  * `out()` is for output messages; it prints to STDOUT.
  * `err()` is for error messages; it prints to STDERR.
  * `log()` calls `out()` prepending a time stamp and PID.
  * `now()` is a timestamp uses UTC and ISO 8601:2004.
  * `zid()` is a 128-bit secure random hex lowercase ID.
  * `die()` is for fatal messages; it prints to STDERR then does exit 1.
  * `die_opt_unk()` means die because an option is unknown.
  * `die_opt_arg()` means die because an option is missing its argument.
  
Code:

    out () { printf %s\\n "$*" ; }
    err () { >&2 printf %s\\n "$*" ; }
    log () { printf '%s %s %s\n' "$( now )" $$ "$*" ; }
    now () { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }
    zid () { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }
    die () { >&2 printf %s\\n "$*" ; exit 1 ; }
	die_opt_unk() { die "Option $1 is unknown" ; }
	die_opt_arg() { die "Option $1 needs an argument" ; }
