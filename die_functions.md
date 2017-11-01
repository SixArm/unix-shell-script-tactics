# die functions

Our scripts may use these all-purpose functions:

  * `die()` is for fatal messages; it prints to STDERR then does exit 1.
  * `die_cmd_unk()` die because a command is unknown.
  * `die_opt_unk()` die because an option is unknown.
  * `die_opt_arg()` die because an option is missing its argument.
  
Code:

    die() { >&2 printf %s\\n "$*" ; exit 1 ; }; export -f die
    die_cmd_unk() { die "Command $1 is unknown" ; }; export -f die_cmd_unk
    die_opt_unk() { die "Option $1 is unknown" ; }; export -f die_opt_unk
    die_opt_arg() { die "Option $1 needs an argument" ; }; export -f die_opt_arg
