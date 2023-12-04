# Script directory: use dirname and realpath

To get a script's own directory, we recommend two options:

```sh
command -v realpath || printf realpath 1>&2 && exit 69
dir=$(dirname "$(realpath "$0")")

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
```

Details below.


## Option 1: realpath is more capable but not POSIX yet

Code:

```sh
command -v realpath || printf "realpath" 1>&2 && exit 69
dir=$(dirname "$(realpath "$0")")
```

The `realpath` technique is a good solution if your system supports it.

* Pros: Works when the script is run directly, or run via symlink, or sourced.

* Cons: Not POSIX yet; it is on track to be added to the next POSIX update.

Details:

* The `realpath` command is installed on many major operating systems on the current versions. The command is also able to be installed on
older operating systems.

* The code `exit 69` is the exit number convention for "Unavailable: a service is unavailable. E.g. a support program or file does not exist."


### Help

To install `realpath` on older macOS via brew:

```sh
brew install coreutils
```


## Option 2: cd is POSIX but less capable

Code:

```sh
dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)
```

The `cd` technique is POSIX and returns the directory of a running script.

Pros: POSIX, and works on a very wide range of systems, including much older systems.

Cons: Does not work if the script is invoked as a symlink, or if the script is sourced.

https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh


### Explanation

The `CDPATH=` is set to a null string so as to ensure that `cd`` never echoes anything.

The `pwd -P` option is used to print the path with all symlinks resolved. This
resolves the resulting directory path to its ultimate target in case the
directory and/or its components are symlinks,


## Comparisons

We do not want to use `readlink -f` because it's not available on some operating systems, such as macOS. The option `-f` is a GNU capability, and not POSIX.
