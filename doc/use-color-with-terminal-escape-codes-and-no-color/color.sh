#!/bin/sh

if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    COLOR_RESET='[0m'
    COLOR_FG_BLACK='[30m'
    COLOR_FG_RED='[31m'
    COLOR_FG_GREEN='[32m'
    COLOR_FG_YELLOW='[33m'
    COLOR_FG_BLUE='[34m'
    COLOR_FG_MAGENTA='[35m'
    COLOR_FG_CYAN='[36m'
    COLOR_FG_WHITE='[37m'
    COLOR_HI_BLACK='[1;30m'
    COLOR_HI_RED='[1;31m'
    COLOR_HI_GREEN='[1;32m'
    COLOR_HI_YELLOW='[1;33m'
    COLOR_HI_BLUE='[1;34m'
    COLOR_HI_MAGENTA='[1;35m'
    COLOR_HI_CYAN='[1;36m'
    COLOR_HI_WHITE='[1;37m'
    COLOR_BG_BLACK='[40m'
    COLOR_BG_RED='[41m'
    COLOR_BG_GREEN='[42m'
    COLOR_BG_YELLOW='[43m'
    COLOR_BG_BLUE='[44m'
    COLOR_BG_MAGENTA='[$5m'
    COLOR_BG_CYAN='[46m'
    COLOR_BG_WHITE='[47m'
else
    COLOR_RESET=''
    COLOR_FG_BLACK=''
    COLOR_FG_RED=''
    COLOR_FG_GREEN=''
    COLOR_FG_YELLOW=''
    COLOR_FG_BLUE=''
    COLOR_FG_MAGENTA=''
    COLOR_FG_CYAN=''
    COLOR_FG_WHITE=''
    COLOR_HI_BLACK=''
    COLOR_HI_RED=''
    COLOR_HI_GREEN=''
    COLOR_HI_YELLOW=''
    COLOR_HI_BLUE=''
    COLOR_HI_MAGENTA=''
    COLOR_HI_CYAN=''
    COLOR_HI_WHITE=''
    COLOR_BG_BLACK=''
    COLOR_BG_RED=''
    COLOR_BG_GREEN=''
    COLOR_BG_YELLOW=''
    COLOR_BG_BLUE=''
    COLOR_BG_MAGENTA=''
    COLOR_BG_CYAN=''
    COLOR_BG_WHITE=''
fi

printf "%sblack\n" $COLOR_FG_BLACK
printf "%sred\n" $COLOR_FG_RED
printf "%sgreen\n" $COLOR_FG_GREEN
printf "%syellow\n" $COLOR_FG_YELLOW
printf "%sblue\n" $COLOR_FG_BLUE
printf "%smagenta\n" $COLOR_FG_MAGENTA
printf "%scyan\n" $COLOR_FG_CYAN
printf "%swhite\n" $COLOR_FG_WHITE
