# Protect scripts by using "set" flags

For POSIX scripts, please start with:

```sh
set -euf
```

For bash/zsh scripts, please start with:

```sh
set -euf -o pipefail
```

Meanings:

  * `set -e` or `set -o errexit`: if there is an error, then exit immediately.

  * `set -u` or `set -o nounset`: disallow unset variables.

  * `set -f` or `set -o noglob`: diasble filename globbing.

  * `set -o pipefail`: if a pipe fails, then exit immediately and use the pipe's exit status.

Note: some scripts won't be able use all these flags. For example, a script that needs filename globbing cannot use `set -f` because it disables globbing. Please note this in the code immediately above the `set` line.

For Bash help on the `set` command see: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html


## Advice

Some programmers debate the usefulness of these flags, because they cause immediate exits, which isn't always what the programmer expects or wants. 

A more-sophisticated approach is write proper error handing for each function.
