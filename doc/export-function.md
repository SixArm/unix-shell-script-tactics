# Export function

We export functions when we want them to be available to other scripts.

One example is when we want to use GNU parallel, and we want parallel to be able to call functions.

Example:

```sh
foo() { echo "hello"; }
export -f foo
```
