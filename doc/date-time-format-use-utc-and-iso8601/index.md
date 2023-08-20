# Date &amp; time format: use UTC and ISO8601

For date values and time values, we prefer:

  * UTC (Universal Coordinated Time, a.k.a. Greenwich Mean Time, Zulu Time Zone, etc.).

  * ISO8601 standard format.

  * Sort-friendly ordering such as YYYY-MM-DD and HH:MM:SS and +00:00.

Format:

  * Date format with year, month number, month-day number: "YYYY-MM-DD".

  * Date-week format with year, week number, week-day number: "YYYY-W##-#"

  * Time format with hour, minute, second, nanosecond: "HH:MM:SS.NNNNNNNNN".

  * Timezone format with hour offset and minute offset: "+HH:MM".

Examples:

  * Date: 2016-12-31

  * Date-week: 2016-W52-7

  * Time: 12:59:59.123456789

  * Timezone: +00:00

  * Timestamp: 2016-12-31T12:59:59.123456789+01:30

Notes:

  * For the time, we use nanoseconds because we want times to be compatible with high-precision systems.

  * For the time nanoseconds, note that as of this writing, the date command on the BSD operating system does not have a nanoseconds option. Consider installing GNU date.
  
  * For the time nanoseconds decimal, we use a period, rather than a comma, because a period looks more like a decimal, and is also easier to use in comma separated values (CSV) files.

  * For the timezone, we prefer using an hour offset and separator and minute offset, rather than using "Z" or "UTC" or "GMT" or "00" or "0000", because we prefer our timezone output to be sortable among multiple timezones, and we want to clearly separate the minutes.
  
