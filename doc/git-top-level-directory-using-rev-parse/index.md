# Git top level directory using rev-parse

We want a program to be able to discover its own git top-level directory.

Our convention: create a function `git_top_dir()`.

```sh
git_top_dir(){ 
    git rev-parse --show-toplevel
}
```

If you prefer one line:

```sh
GIT_TOP_DIR="$(git rev-parse --show-toplevel)"
```
