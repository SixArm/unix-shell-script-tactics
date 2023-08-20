# URL decode

Credit: https://stackoverflow.com/questions/296536/how-to-urlencode-data-for-curl-command

Return a string in which each URL-encoded sequence is replaced with its URL-decoded literal character. 

A URL-encoded sequence is a percent (%) sign followed by two hex digits.

```sh
url_decode() {
  # Because all escape characters must be encoded, we can replace %NN with \xNN
  # and pass the result to printf -b, which will decode the hex characters.
  printf '%b' "${1//\%/\\x}"
}
```

Example:

```sh
$ url_decode "foo%20goo%20hoo"
foo goo hoo
```

Compare url_encode.
