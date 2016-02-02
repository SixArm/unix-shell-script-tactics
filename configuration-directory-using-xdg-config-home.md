### Configuration directory using XDG_CONFIG_HOME

We prefer to have a user's configuration directory a standard place:

  * Use `XDG_CONFIG_HOME` environment variable if it's set,
  * Otherwise `$HOME/.config`.
  * Append the program name so the program has its own subdirectory.
  * Our scripts use the naming convention `confdir()` for the function.
  * Example: the program `foo` uses the configuration directory `~/.config/foo/`.

We prefer this code:

    program(){ echo "foo"; }
    confdir(){ echo "${XDG_CONFIG_HOME:-$HOME/.config/$program}"; }
