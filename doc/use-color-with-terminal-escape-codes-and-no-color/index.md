# Use color with terminal escape codes and NO_COLOR

Color output can be set in a variety of ways.

See the [color.sh](color.sh) script in this directory.

We prefer this approach:

* Use POSIX shell colors; do not use "tput setaf" or "tput setab" etc. This is because tput colors are not POSIX, and also tput tends to be slow.

* Use an embedded actual escape character, rather than a `$'\e'`. This is because dollar quotes are not POSIX.

* If the destination is not a terminal, then do not use color. 

* If the NO_COLOR environment variable is set, then do not use color.

Example:

```sh
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    COLOR_RESET='[0m'
    COLOR_RED='[31m'
    COLOR_GREEN='[32m'
    COLOR_BLUE='[34m'
else
    COLOR_RESET=''
    COLOR_RED=''
    COLOR_GREEN=''
    COLOR_BLUE=''
fi

printf "%sred\n" $COLOR_RED
printf "%sgreen\n" $COLOR_GREEN
printf "%sblue\n" $COLOR_BLUE
```
