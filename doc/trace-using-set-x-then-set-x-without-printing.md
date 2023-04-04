# Trace using set -x then set +x without printing

To help with debugging a script, you can use the "echo before execute" setting:

Turn on "echo before execute":

```sh
set -x
```

Turn off "echo before execute":

```sh
set +x
```

Turn off "echo before execute" without printing the line:

```sh
{ set +x; } 2>/dev/null
```

Example to turn on, then run some commands, then turn off:

```sh
set -x
command1
command2
command3
{ set +x; } 2>/dev/null
```
