# Subshell syntax using parentheses not backticks

To write a subshell command, you can use parentheses or backticks.

Example:

   $(foo)  # yes
   `foo`   # no

We prefer parentheses over backtick because parentheses are nestable.

Example:

   $(foo $(goo $(hoo))

Be aware that escaping characters is slightly different, such as:

     echo $(echo \$abc)
     echo `echo \$abc`

Differences also exist for:

     $(echo \`)
     $(echo \\)

Thanks to http://stackoverflow.com/users/313821/peter-o
