# Print output with `printf` not `echo`

Print output with `printf` not `echo` because of security, consistency across systems, and stability.

The `printf` command does everything the `echo` command does, and more.

Right:

```
printf "%s\n" "foo"
```

Wrong:

```
echo "foo"
```

Some reasons:

* Echo isn't consistent across operating systems.

* Echo output can confused with echo flags. 
