# Process substitution isn't POSIX

Process substitution isn't POSIX compliant and cause trouble.

Process substitution feeds the output of a process (or processes) into the stdin of another process.

Process substitution syntax uses a direction symbol and commands enclosed within parentheses:

Example syntax:

```sh
>(command)

<(command)

>(command) <(command)
```

Example usage:

```sh
$ echo >(true)

$ echo <(true)

$ echo >(true) <(true)
```
