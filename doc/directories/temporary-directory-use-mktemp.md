# Temporary directory: use mktemp

To create a temporary directory we use:

  * The command `mktemp` which creates the directory.
  * If a temp prefix is provided, then use it; we prefer the use `program_command` which returns the name.
  * Otherwise, use a ZID i.e. secure random 32-character hex lowercase string.
  
Code:

    temp_home() { out $(mktemp -d -t "${1:-$(zid)}"); }; export -f temp_home;
    temp_dir() { out $(temp_home "$program_command"; };

Notes:

  * We prefer the terminology "temp" over "tmp", "temporary", etc.
  * Our preference is because "mktemp" uses "temp".
  * And also because "temp" is easier for some cultures to pronounce than "tmp".
