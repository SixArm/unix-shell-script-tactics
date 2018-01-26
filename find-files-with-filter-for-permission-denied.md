# Find with filter for "Permission Denied"

The `find` command can print error messages that say "Permission Denied".

To filter out these errors and use a robust POSIX syntax:

    { LC_ALL=C find . 3>&2 2>&1 1>&3 | grep -v 'Permission denied' >&3; [ $? -eq 1 ]; } 3>&2 2>&1

How it works:

  * `LC_ALL=C` configures the command to show C programming language error messages. These which always use the text "Permission Denied". If we skipped this step, and the system is configured to show localized error messages, then the error messages could be in other languages and thus not filtered.

  * `find .` is the typical find command and the local directory. You can put any of your options here.
  
  * `3>&2 2>&1 1>&` creates a custom file descriptor 3 and temporarily swaps stdout (1) and stderr (2).

  * ` grep -v 'Permission denied'` filters out any lines that contain the text.

  * `[ $? -eq 1 ];` Set the exit code to indicate whether any errors other than Permission denied occurred: 1 if so, 0 otherwise. In other words: the exit code now reflects the true intent of the command: success (0) is reported, if no errors at all or only permission-denied errors occurred.
  
  * `3>&2 2>&1` reswaps the file descriptors, restoring typical stdout and stderr.
  
Details:

  * This is POSIX-compliant.
  
  * Credit: https://stackoverflow.com/questions/762348/how-can-i-exclude-all-permission-denied-messages-from-find


## Alternatives


### Prune

Prune any unreadable items:

    find . ! -readable -prune -o -print:

  * Pro: Fast if your version of `find` has these options.
  
  * Con: This typically requires GNU find, which typically isn't on vanilla macOS.


### Ignore

Ignore errors altogether:

    find . 2>/dev/null > files_and_folders

  * Pro: Fast if you're willing to skip all errors.
  
  * Con: this sacrifices all other errors.


### Sudo

Use the `sudo` command to enable permissions for everything:

    sudo find . > foo

  * Pro: Easy and clear, if you want just to print results.
  
  * Con: anything else in the command runs using sudo as well.


### Merge streams

Merge the streams for stdio and stederr:

    find . 2>&1 | grep -v 'Permission denied' > foo

  * Pro: None, compared to others on this page.
  
  * Con: Real errors don't go to stderr.
