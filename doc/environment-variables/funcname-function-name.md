# $FUNCNAME function name

To know the current function name, we must set it manually for POSIX, and we prefer to use the environmen variable `$FUNCNAME` because it matches the automatic Bash environment variable `$FUNCNAME`. 

To make the code compatible on POSIX and Bash:

```sh
foo() { 
    FUNCNAME=${FUNCNAME:-foo}
    echo "$FUNCNAME"
}
```
