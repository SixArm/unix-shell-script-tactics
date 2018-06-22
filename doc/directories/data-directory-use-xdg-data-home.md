# Data directory: use $XDG_DATA_HOME

We prefer to have a user's data directory in a standard place:

  * Use `XDG_DATA_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.local/share`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    data_home() { out "${XDG_DATA_HOME:-$HOME/.local/share}" ; }; export -f data_home;
    data_dir() { out $(data_home) "/$program_command" ; };

References:

  * https://wiki.archlinux.org/index.php/XDG_Base_Directory_support

Purpose:

  * Where user-specific data files should be written (analogous to /usr/share).
  * Should default to $HOME/.local/share.


