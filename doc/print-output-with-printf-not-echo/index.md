# Print output with `printf` not `echo`

Print output by using the command `printf` instead of the command `echo`. This is because of security, stability, and consistency across systems.

Yes:

```sh
printf "%s\n" "foo"
```

No:

```sh
echo "foo"
```

The command `printf` does everything that the command `echo` does, and more.

Some reasons:

* The command `echo` isn't consistent across operating systems.

* The command  `echo` output options can confused with command line flags. 
