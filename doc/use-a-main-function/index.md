# Use a main() function

Wrap all the code in a main() function that gets called at the bottom of the
file, so that a truncated partial download doesn't accidentally end up executing
half a script.

Example:

```sh
#!/bin/sh
set -eu

main() {
    …
}

main
```
