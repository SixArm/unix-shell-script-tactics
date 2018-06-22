# Log directory: use $LOG_HOME

We prefer to have a user's log directory in a standard place:

  * Use `LOG_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.log`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    log_home() { out "${LOG_DIR:-$HOME/.log}" ; }; export -f log_home;
    log_dir() { out $(log_home)"/$program_command" ; };
