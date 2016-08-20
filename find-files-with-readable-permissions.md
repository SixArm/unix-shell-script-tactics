# Find files with readable permissions

The `find` command can return `Permission denied` directory errors.

To skip these, test the permissions. If there are no readable permissions, then prune it:

    find . ! -perm +222 -prune -o -name '*foo*' -print

Some versions of the `find` command provide a  non-POSIX `-readble` flag:

    find . ! -readable -prune -o -name '*foo*' -print
