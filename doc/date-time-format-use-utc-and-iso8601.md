# Date &amp; time format: use UTC and ISO8601

For date values and time values, we prefer:

  * UTC (Universal Coordinated Time, a.k.a. Greenwich Mean Time, Zulu Time Zone, etc.).

  * ISO8601 standard format.

  * Sort-friendly ordering such as YYYY-MM-DD and HH:MM:SS and +00:00.

Format:

  * Date format: "YYYY-MM-DD".

  * Time format: "HH:MM:SS.NNNNNNNNN".

  * Timezone format: "+HH:MM".

Examples:

  * Date: 2016-12-31

  * Date with weekly format: 2016-W52-7

  * Time: 12:59:59

  * Time with nanoseconds: 12:59:59.123456789

  * Timezone: +00:00

  * Timestamps: 2016-12-31T12:59:59.123456789+00:00

Notes:

  * For the time, we use nanoseconds because we want times to be compatible with high-precision systems.

  * For the time nanoseconds, note that as of this writing, the date command on the BSD operating system does not have a nanoseconds option. Consider installling GNU date.
  
  * For the time nanoseconds decimal, we use a period, rather than a comma, because a period looks more like a decimal, and is also easier to use in comma separated values (CSV) files.

  * For the timezone, we use hours and minutes with a separator, rather than "Z" or "UTC" or "00" or "0000", because we want timezone syntax to sort correctly among multiple timezones, and want to clearly spearate the minutes.
