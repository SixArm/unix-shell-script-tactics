# Arg parse

Argument parsing using a loop in order to find each relevant argument, and remove it from the array.

```sh
for arg; do
    shift
    case $arg in
	--[[:alnum:]][-_[:alnum:]]*)
	    key="${arg#--}"
	    case $arg in
		*=*)
		    key="${key%%=*}"
		    value="${arg#*=}";
		    ;;
		*)
		    value=1
		    ;;
	    esac
	    key="${key//-/_}"
	    eval "$key"=\$value
	    ;;
	*)
	    set -- "$@" "$arg"
	    ;;
    esac
done
```


## Notes

The code `for arg do` is shorthand for `for arg in "$@"; do`.

The code `value=1` is how shell arithmetic represents "true".
