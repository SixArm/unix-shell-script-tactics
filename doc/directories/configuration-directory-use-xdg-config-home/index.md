# Configuration directory: use $XDG_CONFIG_HOME

We prefer to have a user's configuration directory in a standard place:

  * Use `XDG_CONFIG_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.config`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    config_home() { out "${XDG_CONFIG_HOME:-$HOME/.config}" ; }; export -f config_home;
    config_dir() { out $(config_home)"/$program_command" ; };

Notes:

  * We prefer the terminology "config" over "conf", "cfg", etc.
  * Our preference is because "config" is the Unix standard, and also is in the XDG environment variable name.

References:

  * https://wiki.archlinux.org/index.php/XDG_Base_Directory_support

Purpose:

  * Where user-specific configurations should be written (analogous to /etc).
  * Should default to $HOME/.config.
