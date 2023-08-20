# Arg parse

Argument parsing using a loop in order to find each relevant argument, and remove it from the array.

See related:

  * [for arg do loop](../for-arg-do-loop)

  * [Parse options via `while` and `case` not `getopts` or `getopt`](../parse-options-via-while-and-case-not-getopts-or-getopt)

```sh
for arg
do
    shift
    case $arg in
	--[[:alnum:]][-_[:alnum:]]*)
		key="$( printf %s "$arg" | sed 's/^--//; s/[^-_[:alnum:]].*$//' )"
		var="$( printf %s "$key" | sed 's/-/_/g' | tr '[:lower:]' '[:upper:]' )"
	    case $arg in
		--"$key"=)
		    eval "$var"="${arg#*=}"
		    ;;
		--"$key")
		    eval "$var"=1
		    ;;
		*)
			>&2 printf %s\\n "arg: $arg"
			;;
	    esac
	    ;;
	*)
	    set -- "$@" "$arg"
	    ;;
    esac
done
```


## Notes

The code `for arg` is shorthand for `for arg in "$@"`.

The code that sets key to value 1 is because the number 1 is how shell arithmetic represents "true".
