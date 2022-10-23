# die functions

Our scripts may use this all-purpose function:

  * `die()` is for fatal messages; it prints a message to STDERR then exits with code 1, which is the most common error exit code.

Code:

```sh
die() { >&2 printf %s\\n "$*" ; exit 1 ; }; export -f die
```

We sometimes use these functions too:

```sh
die_arg() { die "Argument: $*" ; }; export -f die_arg
die_cmd() { die "Command: $*" ; }; export -f die_cmd
die_dir() { die "Directory: $*" ; }; export -f die_dir
die_opt() { die "Option: $*" ; }; export -f die_opt
die_var() { die "Variable: $*" ; }; export -f die_var
```
