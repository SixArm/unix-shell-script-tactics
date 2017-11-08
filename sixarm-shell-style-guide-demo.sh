#/bin/sh
set -euf

## Program Tracking

program_command="sixarm-shell-style-guide-demo"
program_version="1.0.0"
program_updated="2016-01-11"
program_license="GPL"
program_contact="Alice Adams (alice@example.com)"

## Help Function

help(){
cat << EOF

SixArm shell style guide demo

Syntax:

    sixarm-shell-style-guide-demo.sh

Example:

    sixarm-shell-style-guide-demo --version


## Options

  * --foo=<value>:
      set the foo variable to a value

  * --goo=<value>:
      set the goo variable to a value

  * -h --help: 
      print helpful information

  * -v --version: 
      print the program version number

  * --conf-dir:
      print the configuration directory path

  * --temp-dir:
      print the temporary directory path

  * --program-command:
      print the program command name

  * --program-version:
      print the program version number

  * --program-updated:
      print the program updated date

  * --program-license:
      print the program license name

  * --program-contact:
      print the program contact information for the maintainer


## Tracking

  * Command: $program_command
  * Version: $program_version
  * Updated: $program_updated
  * License: $program_license
  * Contact: $program_contact
EOF
}

out() { printf %s\\n "$*" ; }; export -f out
err() { >&2 printf %s\\n "$*" ; }; export -f err
die() { err $(log) "$*" ; exit 255 ; }; export -f die
log() { printf '%s %s %s\n' "$( now )" $$ "$*" ; }; export -f log
now() { date -u "+%Y-%m-%dT%H:%M:%S.%NZ" ; }; export -f now
sec() { date "+%s" ; }; export -f sec
zid() { hexdump -n 16 -v -e '16/1 "%02x" "\n"' /dev/random ; }; export -f zid
cmd() { command -v $1 >/dev/null 2>&1 ; }; export -f cmd
int() { printf -v int '%d\n' "$1" 2>/dev/null ; }; export -f int

## Number helpers
int() { awk '{ print int($1) }' ; }; export -f int
sum() { awk '{for(i=1; i<=NF; i++) sum+=$i; } END {print sum}' ; }; export -f sum

## Array helpers: array index and array number of fields
ari() { [ $# == 3 ] && awk -F "$2" "{print \$$3}" <<< "$1" || awk "{print \$$2}" <<< "$1" ; }; export -f ari
arn() { [ $# == 2 ] && awk -F "$2" "{print NF}"   <<< "$1" || awk "{print NF}"   <<< "$1" ; }; export -f arn

## Directory helpers: configuration directory and temporary directory
conf_dir() { out "${XDG_CONFIG_HOME:-$HOME/.config/$program_command}" ; }; export -f conf_dir;
temp_dir() { out $(mktemp -d -t $program_command); }; export -f temp_dir;

## Verify a command executable, a script variable, and an env variable
#CURL=${CURL:-curl}; cmd "$CURL" || die_cmd "$CURL"
#foo="${1:-}"; [ -z "$foo" ] && die_var foo
#[ -z ${BAR+x} ] && die_var BAR

if [ "$#" -eq 1 ]; then
  case "$1" in
    -h|--help)
      help; exit 0
      ;;
    -v|--version)
      out $program_version; exit 0
      ;;
    --program-command)
      out $program_command; exit 0
      ;;
    --program-version)
      out $program_version; exit 0
      ;;
    --program-updated)
      out $program_version; exit 0
      ;;
    --program-license)
      out $program_license; exit 0
      ;;
    --program-contact)
      out $program_contact; exit 0
      ;;
    --conf-dir)
      out "$(conf_dir)"; exit 0
      ;;
    --temp-dir)
      out "$(temp_dir)"; exit 0
      ;;
    --*=*)
      key="${1#--}"; key="${key%%=*}";
      val="${1#*=}";
      eval "$key"=\$val
      ;;
  esac
fi
