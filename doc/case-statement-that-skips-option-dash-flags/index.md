# Case statement that skips option dash flags

Example:

```sh
case "$x" in
    --) printf "a double dash indicates no more options\n" ;;
    -*) printf "a starting dash indicates an option\n" ;;
    *) printf "anything else is an argument\n" ;;
esac
```
