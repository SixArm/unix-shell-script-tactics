# for arg do loop
 	
See http://gnu.ist.utl.pt/software/autoconf/manual/autoconf-2.57/html_chapter/autoconf_10.html

To loop over positional arguments, use: 

```sh
for arg
do
  echo "$arg"
done
```

DANGER: You must not leave the do on the same line as for, such as in the example caode below. This is because some shells improperly grok it.
 	
```sh
# DANGER
for arg; do
  echo "$arg"
done
```

DANGER: If you want to explicitly refer to the positional arguments, given the `$@` bug, then you can use the example code below. But keep in mind that Zsh, even in Bourne shell emulation mode, performs word splitting on `${1+"$@"}`; see Shell Substitutions, item `$@', for more. 
 	
```sh
# DANGER
for arg in ${1+"$@"}; do
  echo "$arg"
done
```
