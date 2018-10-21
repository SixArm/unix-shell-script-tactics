# Array functions

We use simple array functions.

  * The function `array_n` returns the array number of fields a.k.a. length.
  * The function `array_i` returns the array item at index i.

Syntax:

  ```shell
  array_n <string> [field separator]
  array_i <string> [field separator] <index>
  ```

Examples:

  ```shell
  array_n 'a b c' => 3
  array_n 'a-b-c' '-' => 3

  array_i 'a b c' 2 =>  'b'
  array_i 'a-b-c' '-' 2 =>  'b'
  ```
    
Source:

  ```shell
  array_n() { [ $# == 2 ] && awk -F "$2" "{print NF}"   <<< "$1" || awk "{print NF}"   <<< "$1" ; }; export -f array_n
  array_i() { [ $# == 3 ] && awk -F "$2" "{print \$$3}" <<< "$1" || awk "{print \$$2}" <<< "$1" ; }; export -f array_i
  ```





    
    