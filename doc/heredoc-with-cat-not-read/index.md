# heredoc with cat not read

POSIX heredoc can run with cat, but cannot run with read (which is a bash convention).

Example to set a variable:

```
x=$(cat<<-EOF
Lorem ipsum
dolor sit amet
EOF
```
