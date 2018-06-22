# Runtime directory: use $XDG_RUNTIME_HOME

We prefer to have a user's runtime directory in a standard place:

  * Use `XDG_RUNTIME_HOME` environment variable if it's set.
  * Otherwise use `$HOME/.runtime`.
  * Append the program command, so the program uses its own subdirectory.

Code:

    runtime_home() { out "${XDG_RUNTIME_HOME:-$HOME/.runtime}" ; }; export -f runtime_home;
    runtime_dir() { out $(runtime_home) "/$program_command" ; };

Purpose:

  * Used for non-essential, user-specific data files such as sockets, named pipes, etc.
  * Not required to have a default value; warnings should be issued if not set or equivalents provided.
  * Must be owned by the user with an access mode of 0700.
  * Filesystem fully featured by standards of OS.
  * Must be on the local filesystem.
  * May be subject to periodic cleanup.
  * Modified every 6 hours or set sticky bit if persistence is desired.
  * Can only exist for the duration of the user's login.
  * Should not store large files as it may be mounted as a tmpfs.

