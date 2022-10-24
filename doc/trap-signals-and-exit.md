# Trap signals and exit

Trap signals, such as user pressing CTRL-C, then call an exiting function.

```sh
trap_exit() {
  # Do any cleanup here, such as closing open files,
  # deleting temp data, or printing results.
}

trap trap_exit EXIT
```

Use `EXIT` instead of TERM, INT, HUP, etc.


## Other trap ideas

We favor the naming convention of trap_<signal> such as:

```sh
trap_exit() { ... }
trap_term() { ... }
trap_int() { ... }
trap_hup() { ... }
```

The naming convention helps make it clear that the functions are related to the trap command and the specific signal.
