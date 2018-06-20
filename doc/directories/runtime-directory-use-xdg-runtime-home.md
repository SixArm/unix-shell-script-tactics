# Runtime directory: use $XDG_RUNTIME_HOME

We prefer to have a user's runtime directory in a standard place:

  * Use `XDG_RUNTIME_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.runtime/`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    runtime_home() { out "${XDG_RUNTIME_HOME:-$HOME/.runtime}" ; }; export -f runtime_home;
    runtime_dir() { out $(runtime_home) "/$program_command" ; };
