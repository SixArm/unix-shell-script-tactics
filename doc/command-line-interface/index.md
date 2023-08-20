# Command line interface


### Pipes

* If input or output is intended to be a file, then the command should also be able use `-`.

* The `-` means read from `stdin` or write to `stdout`.

A command that requires `stdin` should test for it. 

* If the command is run without stdin, such as via an interactive terminal, then the command should print an error and exit, rather than hanging.


### Exit code

Return an exit code integer:

* 0 means success.

* 1 means failure.

Any non-zero number means a different kind failure, for example we use:

* 30 to indicate

Use exit code integers 0-254, not other numbers:

* Because other numbers may not be compatible with some systems and some tools.


### Exit code details

Credit: https://unix.stackexchange.com/questions/418784/what-is-the-min-and-max-values-of-exit-codes-in-linux

Values 0..125 are generally recommended. 

Values 126..255 may be useful for special needs:

* Many shells use 126 and 127 for special conditions.

* Many shells use values above 128 in their `$?` representation of the exit status to encode the signal number of a process being killed and 

* Values 126..255 on `exit()` can be useful in order to mean the same thing as they do for the shell's `$?` (like when a script does `ret=$?; ...; exit "$ret"`). 

Values outside 0..255 are generally not recommended:

* You'd generally only do that if you know the parent will use the `waitid()` API on systems that don't truncate, and you happen to have a need for the 32bit range of values.

* Note that if you do a `exit(2048)` for instance, that will be seen as success by parents using the traditional `wait*()` APIs.

Implementations:

* The number passed to the `_exit()`/`exit_group()` system call (sometimes referred as the exit code to avoid the ambiguity with exit status which is also referring to an encoding of either the exit code or signal number and additional info depending on whether the process was killed or exited normally) is of type int, so on Unix-like systems like Linux, typically a 32bit integer with values from -2147483648 (-231) to 2147483647 (231-1).

* However, on all systems, when the parent process (or the child subreaper or init if the parent died) uses the wait(), waitpid(), wait3(), wait4() system calls to retrieve it, only the lower 8 bits of it are available (values 0 to 255 (28-1)).

* When using the waitid() API (or a signal handler on SIGCHLD), on most systems (and as POSIX now more clearly requires in the 2016 edition of the standard (see `_exit()` specification)), the full number is available (in the `si_status` field of the returned structure). That is not the case on Linux yet though which also truncates the number to 8 bits with the `waitid()` API, though that's likely to change in the future.


## Messages

Use stdout:

* Use standard output (`stdout`) for output messages.

* And anything your user would typically want to pipe to any subsequent command.

Use stderr:

* Use standard error (`stderr`) for error messages.

* And anything your user would not typically want pipe to any subsequent command.

Less is better:

* When a command is running successfully, then it outputs what's necessary, nothing more.

* If you want your command to output unnecessary information, such as progress updates, diagnostics, terminal animations, adjust reports, etc., then write your command so it uses a `--verbose` flag or similar argument.


## Arguments


Arguments for typical commands:

* `--help`: show help

* `--version`: show version number 


Arguments for messages:

* `--verbose`: show verbose messages

* `--debug`: show debug messages

* `--log`: show log messages

* `--quiet`: don't show output


Arguments for interactions:

* `--interactive`: use interactive prompts e.g. show a confirmation yes/no prompt.

* `--force`: skip interactive prompts e.g. do not show a confirmation yes/no prompt.

* `--dry`: show dry-run information e.g. show show what would happen but don't actually do it.


Arguments for output decorations:

* `--color`, `--no-color`: use terminal color codes

* `--emoji`, `--no-emoji`: use emoji characters such as UTF-8 icons


Arguments for input/output formatting:

* `--plain`: use plain text

* `--json`: use JSON formatting

* `--yaml`: use YAML formatting

* `--html`: use HTML formatting

* `--xml`: use XML formatting

* etc.



## Environment 

Environment variables:

* The `TERM` environment variable has the value `dumb`.

* `COLOR`, `NO_COLOR`: use terminal color codes in output messages and error messages.

* `EMOJI`, `NO_EMOJI`: use emoji characters in output messages and error messages.



## Documentation

Write good thorough help:

* Introduction: what the command is, does, needs, syntax, etc.

* Examples: beginner usage, typical usage, corner case usage, etc.

* Requirements: any prerequisites, dependencies, compatibility needs, etc.

* Issues: any known bugs, incompatibilities, untested areas, etc.

* Contact: any web link, email address, message channel, etc.

* Feedback: any ways a user can send questions, suggestions, bugs, etc.

* Legal: any license, or copyright, or compliance, etc.


### Color

Use color if you wish.

Omit color if:

* stdout or stderr is not an interactive terminal (a TTY).

* The `NO_COLOR` environment variable is set.

* The `TERM` environment variable has the value `dumb`.

* The user passes the option `--no-color`.

* You may also want to add a MYAPP_NO_COLOR environment variable in case users want to disable color specifically for your program.


## Credit

Thanks to https://clig.dev/

