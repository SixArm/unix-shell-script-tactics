# Cache directory: use $XDG_CACHE_HOME

We prefer to have a user's cache directory in a standard place:

  * Use `XDG_CACHE_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.cache/`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    cache_home() { out "${XDG_CACHE_HOME:-$HOME/.cache}" ; }; export -f cache_home;
    cache_dir() { out $(cache_home) "/$program_command" ; };
