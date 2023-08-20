# Trap signals and exit

Trap signals, such as user pressing CTRL-C, then call a function that exists gracefully:

```sh
trap_exit() {
  # Do any cleanup here, such as closing open files,
  # deleting temporary data, or printing results.
}

trap trap_exit EXIT
```


## Trap exit, term, int, hup

If you only trap one signal, then prefer to trap `EXIT` instead of `TERM`, `INT`, `HUP`, etc. This is because `EXIT` is the most-significant of these signals.

If you prefer to trap multiple signals, then we favor the naming convention of trap_<signal> such as:

```sh
trap_exit() …

trap_term() …

trap_int() …

trap_hup() …
```

This naming convention helps clarify that the functions are related to the trap command and also to the specific signal.
