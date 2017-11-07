# Temporary directory using `mktemp` and `program`

To create a temporary directory we use:

  * The command `mktemp` which creates the directory.
  * Our variable `program_command` which returns the name.
  * Our scripts use the naming convention `temp_dir()` for the function.
  * Our scripts use the naming convention `--temp-dir` for the argument.
  
Code:

    temp_dir() { out $(mktemp -d -t $program_command); }; export -f temp_dir;
