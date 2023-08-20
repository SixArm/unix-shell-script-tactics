# Source with dot operator `.` not keyword `source`

Source a file by using the dot operator `.` not the word `source`

The operator reads and executes commands from a filename argument in the current shell context.

* Using the dot operator `.` is POSIX compliant.

* Using the keyword `source`  isn't POSIX compliant. 

Yes:

```sh
. foo
```

No:

```sh
source foo
```
