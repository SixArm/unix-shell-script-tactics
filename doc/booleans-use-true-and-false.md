# For booleans use true and false

Booleans using true and false can use the shell built-in commands like this:

```sh
x=true
if [ "$x" = true ]; then
    ...
fi
```

Notice that this is not using numbers (such as 0 or 1) and not using commands (such as `/bin/true` or `/bin/false`)
