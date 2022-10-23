# Program dir using pwd and dirname

We want a program to know it's own directory.

Our convention: create a function `program_dir()`.

```sh
program_dir(){ cd $(dirname "${0}") > /dev/null; echo $(pwd -L); cd - > /dev/null;  }
```

There may be a better way; if you know a better way, please let us know.

  * We do not want to use `readlink -f` because it's not available on macOS.

  * We want a way that runs on any modern shell, including bash, zsh, and fish.
