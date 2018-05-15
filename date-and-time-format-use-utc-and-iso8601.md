# Date &amp; time format: use UTC and ISO8601

For date values and time values, we prefer:

  * UTC (Universal Coordinated Time, a.k.a. Greenwich Mean Time, Zulu Time Zone, etc.)

  * ISO8601 standard format and sort-friendly ordering such as YYYY-MM-DD and HH:MM:SS.

  * To format a time, use nanoseconds; note these won't work on default BSD.

Examples:

  * Time: 12:59:59

  * Time with nanoseconds: 12:59:59.123456789 (for the decimal point, we use a period, not a comma)

  * Date: 2016-12-31

  * Date with weekly format: 2016-W52-7

  * Timestamping: 2016-12-31T12:59:59Z (we use formatting and Zulu time)

Notes:

  * For the time nanoseconds decimal, we use a period not a comma, because a period looks more like a decimal, and is also easier to use in comma separated values (CSV) files.
