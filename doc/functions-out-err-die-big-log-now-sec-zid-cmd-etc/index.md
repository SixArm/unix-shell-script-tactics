# Functions: out, err, die, log, now, sec, zid, cmd, etc.

Our scripts may use these all-purpose functions:

  * `out` is for output messages; it prints to STDOUT.
  * `err` is for error messages; it prints to STDERR.
  * `die` is for fatal messages; it prints to STDERR then exits.
  * `big` is for banner messsages; it prints to STDOUT.
  * `log` call `out()` prepending a time stamp and PID.
  * `now` return a timestamp using UTC and ISO 8601:2004.
  * `sec` return a timestamp using UTC and Unix epoch second.
  * `zid` return a 128-bit secure random hex lowercase ID.
  * `cmd` return a path to the default runnable command in $1.

Code:

```sh
out() { printf %s\\n "$*" ; }; export -f out
err() { >&2 printf %s\\n "$*" ; }; export -f err
die() { >&2 printf %s\\n "$*" ; exit 1 ; }; export -f die
big() { printf \\n###\\n#\\n#\ %s\\n#\\n###\\n\\n "$*"; }; export -f big
log() { printf '%s %s %s\n' "$( now )" $$ "$*" ; }; export -f log 
now() { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }; export -f now
sec() { date -u "+%s" ; }; export -f sec
zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }; export -f zid
cmd() { command -v "$1" >/dev/null 2>&1 ; }; export -f cmd
```

## Caveat about now()

If you use `now()` on a platform where the date command does not support the nanosecond format, then the output will show "%N". This is harmless. 

If you wish, you can install a date command such as GNU date that does support the nanosecond format. 

For example on macOS 10.13, the built-in date command does not support the nanosecond format. If you wish, you can install GNU date and many other GNU commands, and also prefer them to the built-in commands, by using Homebrew like this: `brew install coreutils --with-default-names`.


## Caveat about sec()

If you use `sec()` on many platforms, then see [sec() function portability](../sec-function-portability)
