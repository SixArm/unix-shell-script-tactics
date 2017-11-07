#/bin/sh

## Security ##

set -euf
#trap "exit 1" TERM
#export TOP_PID=$$

## Program Tracking ##

program_command="sixarm-shell-style-guide-demo"
program_version="1.0.0"
program_updated="2016-01-11"
program_license="GPL"
program_contact="Alice Adams (alice@example.com)"
program_variant="$program_command version $program_version updated $program_updated"

## Help Function ##

help(){
cat << EOF

My Awesome Script

Command: $program_command
Version: $program_version
Updated: $program_updated
License: $program_license
Contact: $program_contact
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
    --help)
      help; exit 0
      ;;
    -v|--version|--variant)
      out $program_variant; exit 0
      ;;
    --program-name)
      out $program_name; exit 0
      ;;
    --program-version)
      out $program_version; exit 0
      ;;
    --program-variant)
      out $program_variant; exit 0
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
    --foo=*)
      out "${1#--foo=}"; exit 0
      ;;
    --goo=*)
      out "${1#--goo=}"; exit 0
      ;;
  esac
fi
