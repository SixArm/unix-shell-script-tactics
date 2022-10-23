# Do while loop

One way to accomplish a `do...while` concept is by using `while true` and a `break`:

```sh
while true; do
    ... commands ...
    condition || break
done
```

A versatile version of a `do...while` concept can use this structure:

```sh
while
    ... commands ...
do :; done
```

Example:

```sh
i=3
while
    echo "example $i"          # this command runs each iteration
    : ${start=$i}              # capture the starting value of i
    echo "in the loop"         # your code goes here; needed for the loop
    i="$((i+1))"               # increment the variable of the loop.
    [ "$i" -lt 20 ]            # test the limit of the loop.
do :;  done
```

Notes:

  * Credit: http://unix.stackexchange.com/questions/60098/do-while-or-do-until-in-posix-shell-script
