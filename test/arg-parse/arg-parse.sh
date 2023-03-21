#!/bin/sh
set -eufx

for arg
do
    shift
    case $arg in
	--[[:alnum:]][-_[:alnum:]]*)
		key="$( printf %s "$arg" | sed 's/^--//; s/[^-_[:alnum:]].*$//' )"
		var="$( printf %s "$key" | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' )"
	    case $arg in
		--"$key"=*)
		    eval "$var"="${arg#*=}"
		    ;;
		--"$key")
		    eval "$var"=1
		    ;;
		*)
			>&2 printf %s\\n "arg: $arg"
			;;
	    esac
		unset key var
	    ;;
	*)
	    set -- "$@" "$arg"
	    ;;
    esac
done
unset arg

set +x
set
printf %s\\n "$@"
