# Run executable with no file name extension

Run executable with no file name extension.

Yes:

```sh
$ foo
```

No:

```sh
$ foo.sh
$ foo.bash
$ foo.zsh
…
```

Executables should omit file name extensions, such as `.sh` or `.bash` or `.zsh`.

This is because an executable file name extension is unnecessary, and also easy accidentally set incorrectly. For example, we have some customers with scripts that show the extension `.sh` yet the scripts require functionality of `bash`.



## Shebang

To ensure which shell is needed, write the first line of the script as a shebang such as these below.

For a script that can run on any POSIX current shell:

```sh
#!/usr/bin/env sh
```

If your script must use the `bash` shell then use:

```sh
#!/usr/bin/env bash
```

If your script must use the `zsh` shell then use:

```sh
#!/usr/bin/env zsh
```


## Exceptions

If you know what you're doing, then there are some rare times you may want to specify a file name extension, or specify a shell using shebang that isn't an actual script requirement. 

For example, we have some customers who want to have shell-specific scripts, such as for optimizations, or deployments to different systems with different default shells. For example, one customer has `foo.sh` and `foo.bash` and `foo.zsh` all in the same directory; the deployment process chooses which script is deployed to which systems.
