# Use color with terminal escape codes and NO_COLOR

Color output can be set in a variety of ways.

See the [color.sh](color.sh) script in this directory.

We prefer this implementation:

* Use POSIX shell color escape strings. Do not use "tput setaf" to set foreground color, or "tput setab" to set background color, or "tput sgr0" to reset color. This is because tput colors are not POSIX, and also tput tends to be slow.

* Use an embedded actual escape character. Do not use dollar quoting such as `$'\e'`. This is because dollar quoting is not POSIX.

We prefer this gating:

* Ensure the destination is a terminal. If the destination is not a terminal, then do not use color. 

* Ensure the user wants color. If the NO_COLOR environment variable is set, or the TERM environment variable is set to "dumb", then do not use color.

Example:

```sh
if [ -t 1 ] && [ -z "${NO_COLOR:-}" ] && [ "${TERM:-}" != "dumb" ]; then
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
