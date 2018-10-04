# Script directory

To get the directory of a running script:

    dir() { CDPATH= cd -- "$(dirname -- "$0")" && pwd -P ; }

This solution is POSIX. However, it's not perfect; it has issues with symlinks, and also does not work if the script is sourced.

https://stackoverflow.com/questions/29832037/how-to-get-script-directory-in-posix-sh
