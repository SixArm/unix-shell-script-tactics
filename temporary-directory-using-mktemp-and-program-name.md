# Temporary directory using `mktemp` and `program`

To create a temporary directory we use:

  * The command `mktemp` which creates the directory.
  * If a temp prefix is provided, then use it; we prefer the use `program_command` which returns the name.
  * Otherwise, use a ZID i.e. secure random 32-character hex lowercase string.
  * Our scripts use the naming convention `temp_dir()` for the function.
  * Our scripts use the naming convention `--temp-dir` for the argument.
  
Code:

    temp_dir() { out $(mktemp -d -t "${1:-$(zid)}"); }; export -f temp_dir;

Usage:

    temp_dir $program_name

Output:

    /var/folders/nm/gszn6mcd7qq3rrvfwc8qvf600000gq/T/ad7108c4d53c58d65aa5d34604ec92fa.95NUIBFo
