# Array functions

We use simple array functions.

  * The function `arn` returns the array number of fields.
  * The function `ari` returns the array item at index i.

Syntax:

  ```shell
  arn <string> [field separator]
  ari <string> [field separator] <index>
  ```

Examples:

  ```shell
  arn 'a b c' => 3
  arn 'a-b-c' '-' => 3

  ari 'a b c' 2 =>  'b'
  ari 'a-b-c' '-' 2 =>  'b'
  ```
    
Source:

  ```shell
  arn() { [ $# == 2 ] && awk -F "$2" "{print NF}"   <<< "$1" || awk "{print NF}"   <<< "$1" ; }; export -f arn
  ari() { [ $# == 3 ] && awk -F "$2" "{print \$$3}" <<< "$1" || awk "{print \$$2}" <<< "$1" ; }; export -f ari
  ```





    
    