# Temporary directory using `mktemp` and `program`

To create a temporary directory we use:

  * `mktemp` which creates the directory
  * our own `program` function that returns the program name.

Code:

    program(){ echo "ssid-ample" }
    tempdir(){ echo $(mktemp -d -t $program) }
