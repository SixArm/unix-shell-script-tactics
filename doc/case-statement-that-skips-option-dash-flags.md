# Case statement that skips option dash flags

Example:

```sh
case "$x" in
    --) echo "a double dash terminates options" ;;
    -*) echo "a single dash is an option" ;;
    *) echo "anything else is an argument" ;;
esac
```
