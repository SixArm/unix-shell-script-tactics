# sec() function portability

Our scripts define the `sec()` function. It returns the count of seconds since 1970-01-01 00:00:00 UTC.

We use this code:

    sec() { date "+%s" }

If you need to support a wide range of platforms, then we recommend this code:

    sec() {
      if date '+%s' >/dev/null 2>&1; then
        date '+%s'
      elif command -v perl >/dev/null 2>&1; then
        perl -e "print time"
      elif command -v truss >/dev/null 2>&1 && [ "$(uname)" = SunOS ]; then
        truss date 2>&1 | grep ^time | awk -F"= " '{print $2}'
      elif command -v truss >/dev/null 2>&1 && [ "$(uname)" = FreeBSD ]; then
        truss date 2>&1 | grep ^gettimeofday | cut -d "{" -f2 | cut -d "." -f1
      fi
    }

Thanks to [whetu](https://www.reddit.com/user/whetu) for the portable version.
