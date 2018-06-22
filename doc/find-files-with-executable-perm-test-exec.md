# Find files with exectuable, perm, test, exec

To find files that are executable by the user, using a POSIX compatible syntax:

    find . -type f \( -perm -u=x -o -perm -g=x -o -perm -o=x \) -exec test -x {} \; -print

To find files and run them:

    find . -type f \( -perm -u=x -o -perm -g=x -o -perm -o=x \) -exec test -x {} \; -exec {} \;


## Details

From https://stackoverflow.com/questions/4458120/unix-find-search-for-executable-files

Finding files that are executable can refer to two distinct use cases:

  * user-centric: find files that are executable by the current user.
  * file-centric: find files that have (one or more) executable permission bits set.

Note that in either scenario it may make sense to use find -L ... instead of just find ... in order to also find symlinks to executables.

Note that the simplest file-centric case - looking for executables with the executable permissions bit set for ALL three security principals (user, group, other) - will typically, but not necessarily yield the same results as the user-centric scenario - and it's important to understand the difference.

## User-centric

To find user-centric excutable files:

  * If you are using GNU find, then use the `-executable` flag. The flag matches only files the current user can execute (there are edge cases).

  * If you are using BSD-based platforms, including macOS, then there is no `-executable` flag.


## File-centric

To answer file-centric questions, it is sufficient to use the POSIX-compliant -perm primary (known as a test in GNU find terminology).

  * `-perm` allows you to test for any file permissions, not just executability.

  * Permissions are specified as either octal or symbolic modes. Octal modes are octal numbers (e.g., 111), whereas symbolic modes are strings (e.g., a=x).

  * Symbolic modes identify the security principals as "u" (user), "g" (group) and "o" (other), or "a" (all three). Permissions are expressed as x for executable, for instance, and assigned to principals using operators =, + and -; for a full discussion, including of octal modes, see the POSIX spec for the chmod utility.


## Notes

In the context of find:

  * Prefixing a mode with - (e.g., -ug=x) means: match files that have all the permissions specified (but matching files may have additional permissions).

  * Having NO prefix (e.g. 755) means: match files that have this full, exact set of permissions.

  * Caveat: Both GNU find and BSD find implement an additional, nonstandard prefix with are-ANY-of-the-specified-permission-bits-set logic, but do so with incompatible syntax.
