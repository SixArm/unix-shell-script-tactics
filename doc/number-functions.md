# Number functions


## int()

Code:

```sh
int() { awk '{ print int($1) }' ; export -f int
```

We considered other implementations, but they did not work on more systems, or had issues with negative numbers, or interpreting a leading zero as octal, etc.:

```sh
printf -v int '%d\n' "$1" 2>/dev/null
```


## sum()

Code:

```sh
sum() { awk '{for(i=1; i<=NF; i++) sum+=$i; } END {print sum}' ; }; export -f sum
```
