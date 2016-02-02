# Version name using semantic versioning

We prefer version numbering that uses semantic versioning: http://semver.org/

Our convention: create a function `version()`.

Example:

    version() { echo "1.2.3"; }

The function must return a semantic version string such as:
