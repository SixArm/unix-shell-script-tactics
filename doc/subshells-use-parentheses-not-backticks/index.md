# Subshells: use parentheses not backticks

To write a subshell command, you can use parentheses or backticks.

Example:

```sh
$(foo)  # yes
`foo`   # no
```

We prefer parentheses over backtick because parentheses are nestable.

Example:

```sh
$(foo $(goo $(hoo))
```

Be aware that escaping characters is slightly different, such as:

```sh
echo $(echo \$abc)
echo `echo \$abc`
```

Differences also exist for:

```sh
$(echo \`)
$(echo \\)
```

Thanks to http://stackoverflow.com/users/313821/peter-o
