# Trap signals and exit

Trap signals, such as user pressing CTRL-C, and call an exiting function.

```sh
exiting() {
  # Do any cleanup here, such as closing open files,
  # deleting temp data, or printing results.
}

trap exiting EXIT
```

Use `trap "..." EXIT` instead of TERM, INT, HUP, etc.
