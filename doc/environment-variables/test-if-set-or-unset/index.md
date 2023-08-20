# Environment variables: test if set or unset

POSIX test if set:

```sh
if [ -n "${FOO+1}" ]; then
```

POSIX test if unset:

```sh
if [ -z "${FOO+1}" ]; then
```

How it works: `${var+1}` is a parameter expansion which evaluates to nothing if `var` is unset, and substitutes the string `1` otherwise.

We prefer `+1` over `+x` because `1` is already defined and already means true, and also because `+1` is the most-common way in POSIX posts that we read.

Note: For the unset test, quotes can be omitted, yet we prefer to use quotes because we believe they increase clarity, consistency, and to bulletproofing for novices in case someone changes the test from unset to set. The reason quotes can be ommitted for the unset test, i.e. using `${var+1}` instead of `"${var+1}"`, is because this syntax and usage guarantees this will only expand to something that does not require quotes (since it either expands to `1` (which contains no word breaks so it needs no quotes), or to nothing (which results in `[ -z  ]`, which conveniently evaluates to the same value (true) that `[ -z "" ]` does as well)).


See https://stackoverflow.com/questions/3601515/how-to-check-if-a-variable-is-set-in-bash


## Do not use

Bash and Zsh above certain versions:

```sh
if [[ -v FOO ]]; then

if [[ -z FOO ]]; then
```
