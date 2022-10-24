# Parse options via `while` and `case` not `getopts` or `getop`

Unix shell scripts have a variety of ways to do options parsing such as:

* `while` and `case` which you write yourself.

* `getopts` is a POSIX standard. See <https://pubs.opengroup.org/onlinepubs/7908799/xcu/getopts.html>.

* `getopts_long` is a POSIX script. See <http://stchaz.free.fr/getopts_long.sh>.

* `getopt` is a GNU tool. See <https://www.gnu.org/software/libc/manual/html_node/Getopt.html>.

* `zparseopts` is a Z shell tool. See the man page `zshmodules(1)`.

There are pros and cons to each.

If you want simple parsing, then we recommend writing your own via `while` and `case`.

If you want sophisticated parsing, then we recommend changing from a Unix shell script to a more-capable programming language.


## `while` and `case`

Use a `while` infinite loop that contains a `case` statement for all the command line options.

Example:

```sh
# Set verbose level to default 0 
verbose=0

# Set any options to defaults
foo=""

# Process all the command line options
while :; do
    case $1 in
        # Two hyphens ends the options parsing
        --)
            shift
            break
            ;;
        # Print help by calling a help() function that you define later
        -h|--help)
            help
            exit
            ;;
        # Each verbose option is treated as incrementing the verbose level
        -v|--verbose)
            verbose=$((verbose + 1))
            ;;
        # Parse an option value via this syntax: --foo bar
        -f|--foo)
            if [ -n "$2" ]; then
                foo=$2
                shift
            else
                die "The command option --foo requires a value"
            fi
            ;;
        # Parse an option value via this syntax: --foo=bar
        --foo=?*)
            foo=${1#*=}
            ;;
        # Parse an option value via this syntax: --foo= (i.e. blank)
        --foo=)
            die "The command option --foo requires a value"
            ;;            
        # Anything remaining that starts with a dash triggers a fatal error
        -?*)
            die "The command line option is unknown: " "$1"
            ;;
        # Anything remaining is treated as content not a parseable option
        *)
            break
    esac
    shift
done

help(){
cat << EOF
    # add your help documentation here
EOF
}

die(){
    >&2 printf %s\\n "$*"
    exit 1
}
```


## getops versus getop

In practice there are significant differences between `getopts` and `getopt` and their various versions on various systems:

* The `getopts` POSIX standard can parse a short option, but not a long option, whereas `getopt`can do both. Example: "-h" is a short option, and "--help" is a long option.

* The `getopt` tool has had parsing issues when there is an empty argument string. Example: "--foo=bar" succeeds, whereas "--foo=" fails even though it could mean that foo should be set to a blank string.

* Different capabilities can happen depending on the specific system. Example: some systems do not come with `getop`, whereas some systems do come with `getop` yet there are different versions with different capabilties due to use of different package sources such as `util-linux` versus `linux-utils`.


## getopts_long 

This is written as a POSIX shell function that we embed within a shell script.

When you want the best capabilties for options parsing, and you do not want to change from a Unix shell script to a more-capable programming language, then try `getopts_long`.


## zparseopts

This is an approach that is specific to Z shell (zsh).

When you have a specification that states the shell script will exclusively run on Z shell, then try `zparseopts`.
