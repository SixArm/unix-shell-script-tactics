# heredoc with cat not read

POSIX heredoc can run with cat, but cannot run with read (which is a bash convention).

Example to write a file:

```sh
cat << EOF > foo.txt
Lorem ipsum
dolor sit amet
EOF
```

Example to write a file, using the format `<<-` which ignores leading tabs:

```sh
cat <<- EOF > foo.txt
    Lorem ipsum
    dolor sit amet
EOF
```

Example to set a variable:

```sh
x=$(cat <<- EOF
Lorem ipsum
dolor sit amet
EOF
```
