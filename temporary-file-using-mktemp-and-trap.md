# Temporary file using `mktemp` and `trap`

To create a temporary file:

    file=$(mktemp)

Why use `mktemp` instead of `tempfile`? Because `mktemp` is available on more systems.

To remove a temporary file when the program exist:

    trap "rm -f $file" EXIT

Why trap on EXIT, instead of TERM, INT, HUP? Because EXIT covers all the cases.
