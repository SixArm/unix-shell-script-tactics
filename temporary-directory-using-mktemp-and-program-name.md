# Temporary directory using `mktemp` and `program`

To create a temporary directory we use:

  * The command `mktemp` which creates the directory.
  * Our variable `program_command` which returns the name.
  * Our scripts use the naming convention `tmp_dir()` for the function.
  * Our scripts use the naming convention `--tmp-dir` for the argument.
  
Code:

    tmp_dir() { out $(mktemp -d -t $program_command); }; export -f tmp_dir;
