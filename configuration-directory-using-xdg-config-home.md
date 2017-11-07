### Configuration directory using XDG_CONFIG_HOME

We prefer to have a user's configuration directory a standard place:

  * Use `XDG_CONFIG_HOME` environment variable if it's set,
  * Otherwise use `$HOME/.config`.
  * Append the program name so the program has its own subdirectory.
  * Our scripts use the naming convention `conf_dir()` for the function.
  * Our scripts use the naming convention `--conf-dir` for the argument.
  * Example: the program `foo` uses the configuration directory `~/.config/foo/`.

Code:

    conf_dir() { out "${XDG_CONFIG_HOME:-$HOME/.config/$program_command}" ; }; export -f conf_dir;
    