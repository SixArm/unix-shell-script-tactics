### Configuration directory using XDG_CONFIG_HOME

We prefer to have a user's configuration directory a standard place:

  * Use `XDG_CONFIG_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.config`.
  * Our scripts use the naming convention `config_dir()` for the function.
  * Our scripts use the naming convention `--config-dir` for the argument.

Code:

    config_dir() { out "${XDG_CONFIG_HOME:-$HOME/.config}" ; }; export -f config_dir;

We prefer to have a program's configuration file(s) in a subdirectory::

  * Our scripts append the program name so the program has it's own subdirectory.
  * Example: the program `foo` uses the configuration directory `~/.config/foo/`, and not the file `~/.config/foo.txt`.

Code:

    config_program_dir =  $(config_dir) "/$program_name"

We prefer the terminology "config" over "conf", "cfg", etc., because "config" is the Unix standard, and in the XDG environment variable name.
