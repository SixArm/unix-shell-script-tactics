# Snippets

This page has shell script snippets. These are POSIX-compatible.

### find

When we use the `find` command, we want to handle paths with unusual characters, such as spaces.

Simple find -exec with '\;'. This may be unwieldy if COMMAND is large. This creates a separate process per file.

    find . -exec COMMAND... {} \;

Simple find -exec with '\+'. If COMMAND is able to take multiple files, this is faster.

    find . -exec COMMAND... {} \+

Find items in the current directory that start with a space or end with a space:

    find . -type d \( -regex '\./ .*' -o -regex '.* ' \) -exec echo "==={}===" \;


Find and switch to each file's directory then execute a command from there:

    find . -name '*.txt' -execdir /mycmd {} \;

Find items and run a shell script on each item. This works portably.  Use '\'' for single-quote in command. This runs a subshell, so variable values are lost after each iteration.

    find . -exec sh -c '
    for file do
       ...  # Use "$file" not $file
    done' sh {} +

Credit: http://www.dwheeler.com/essays/filenames-in-shell.html

Find files with leading and/or trailing spaces then fix them:

    find . -maxdepth 1 \( -regex '\./ .*' -o -regex '.* ' \) -exec sh -c '
    for src do
        src=${src/#.\//}
        dst="$src"
        dst=${dst/# */}
        dst=${dst/% */}
        echo "==$src== ==$dst=="
        mv --interactive "$src" "$dst"
    done' sh {} +


### while loop with an index

Example:

    i=0
    max=3
    while [ "$i" -le "$max" ]
    do
        echo "output: $i"
        true $((i=i+1)
    done

Notes:

  * `true $(( i++ ))` doesn't work in all cases, so we use `true $((i=i+1))`.
  * Credit: http://stackoverflow.com/questions/1445452/shell-script-for-loop-syntax


### do ... while loop

One way to accomplish a do ... while loop:

    while true; do
        ... commands ...
        condition || break
    done

A versatile version of a do ... while has this structure:

    while
        ... commands ...
    do :; done

Example:

    i=3
    while
        echo "example $i"          # this command runs each iteration
        : ${start=$i}              # capture the starting value of i
        echo "in the loop"         # your code goes here; needed for the loop
        i="$((i+1))"               # increment the variable of the loop.
        [ "$i" -lt 20 ]            # test the limit of the loop.
    do :;  done

Notes:

  * Credit: http://unix.stackexchange.com/questions/60098/do-while-or-do-until-in-posix-shell-script


### case statement that skips option flags

Example:

    case "$x" in
        --) echo "a double dash terminates options" ;;
        -*) echo "a single dash is an option" ;;
         *)  echo "anything else is an argument" ;;
    esac


### Subshell syntax

To write a subshell command, you can use parentheses or backticks, such as:

   $(foo)  # yes
   `foo`   # no

Why use `$()` instead of backticks? Because parentheses are nestable, such as:

   $(foo $(goo $(hoo))

Be aware that escaping characters is slightly different, such as:

     echo $(echo \$abc)
     echo `echo \$abc`

Differences also exist for:

     $(echo \`)
     $(echo \\)

Thanks to http://stackoverflow.com/users/313821/peter-o


### Temporary files and trap

To create a temporary file:

    file=$(mktemp)

Why use `mktemp` instead of `tempfile`? Because `mktemp` is available on more systems.

To remove a temporary file when the program exist:

    trap "rm -f $file" EXIT

Why trap on EXIT, instead of TERM, INT, HUP? Because EXIT covers all the cases.
