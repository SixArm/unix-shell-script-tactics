# While loop with index counter

To create a while loop with an index counter, and make it POSIX standard, we create the index variable before the loop.

Example:

```sh
i=0
max=3
while [ "$i" -le "$max" ]; do
    echo "output: $i"
    true $((i=i+1)
done
```

Notes:

  * `true $(( i++ ))` doesn't work in all cases, so we use `true $((i=i+1))`.

  * Credit: http://stackoverflow.com/questions/1445452/shell-script-for-loop-syntax
