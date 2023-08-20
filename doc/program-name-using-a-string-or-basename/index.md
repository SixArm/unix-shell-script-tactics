# Program name using a string name or basename

We prefer a program to be able to return its own name.

Our convention: create a function `program()`.

The function can return a string name such as:

```sh
program() { 
        printf "%s\n" "our-demo-tool"
}
```

If the program may use dynamic naming, then the function can calculate a name:

```sh
program(){
        printf "%s\n" "$(basename "$0")"
}
```

There may be a better way; if you know a better way, please let us know.
