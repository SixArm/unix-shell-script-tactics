# Version name: use semantic versioning

We prefer to give each script a version name a.k.a. version number, and we prefer to use semantic versioning: http://semver.org/

The important aspect to our teams is that documenting the version name makes it easier for our teammates to understand when to upgrade to a newer version, and easier to document features and issues.

We prefer to create a function `version()` such as:

    version() { printf %s "1.0.0"; }

We work with some organizations that prefer to use a variable such as:

    version="1.0.0"

We work with some organizations that prefer to use a comment such as:

    # version 1.0.0
    
