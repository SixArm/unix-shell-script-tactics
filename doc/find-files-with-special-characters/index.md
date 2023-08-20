# Find files with special characters

When we use the `find` command, we want to handle paths with special characters, such as spaces, tabs, newlines, etc.

Simple find -exec with '\;'. This may be unwieldy if COMMAND is large. This creates a separate process per file.

```sh
find . -exec COMMAND... {} \;
```

Simple find -exec with '\+'. If COMMAND is able to take multiple files, this is faster.

```sh
find . -exec COMMAND... {} \+
```

Find items in the current directory that start with a space or end with a space:

```sh
find . -type d \( -regex '\./ .*' -o -regex '.* ' \) -exec echo "==={}===" \;
```

Find and switch to each file's directory then execute a command from there:

```sh
find . -name '*.txt' -execdir /mycmd {} \;
```

Find using portable semicolon and portable null termination:

```sh
find . -exec printf %s\\0 '{}' \;
```

Find using portable semicolon and portable null termination, then a while loop:

```sh
find . -exec printf %s\\0 '{}' \; | while read -d $'\0' file; do ...
```

Find items and run a shell script on each item. This works portably.  Use '\'' for single-quote in command. This runs a subshell, so variable values are lost after each iteration.

```sh
find . -exec sh -c '
for file do
    ...  # Use "$file" not $file
done' sh {} +
```

Credit: http://www.dwheeler.com/essays/filenames-in-shell.html

Find files with leading and/or trailing spaces then fix them:

```sh
find . -maxdepth 1 \( -regex '\./ .*' -o -regex '.* ' \) -exec sh -c '
for src do
    src=${src/#.\//}
    dst="$src"
    dst=${dst/# */}
    dst=${dst/% */}
    echo "==$src== ==$dst=="
    mv --interactive "$src" "$dst"
done' sh {} +
```
