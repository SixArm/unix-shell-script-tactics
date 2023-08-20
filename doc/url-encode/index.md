# URL encode

Credit: https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command

Return a string in which each URL-sensitive character is replaced with a
URL-encoding, which is a percent sign then two hex digits. 

```sh
url_encode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o
  for (( pos=0 ; pos<strlen ; pos++ )); do
     c=${string:$pos:1}
     case "$c" in
        [-_.~a-zA-Z0-9] ) o="${c}" ;;
        * ) printf -v o '%%%02x' "'$c"
     esac
     encoded+="${o}"
  done
  printf %s "${encoded}"
}
```

Example:

```sh
$ url_encode "foo goo hoo"
foo%20goo%20hoo
```

Compare url_decode.
