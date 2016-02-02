# Help function using here document and metadata

We prefer a help function vs. header comments.

Code:

    help(){
      echo "Foo script: this script does something cool."
    }

To write help that uses more than one line, we prefer using a "here document" like this:

    cat << END
    Foo script: this script does something cool.

    Here is a good place for an explanation of the syntax,
    and examples, and explanations of any options, etc.

    END
    }

If a script is intended for the public then we add tracking metadata:

    help(){
    cat << END
    Foo script: this script does something cool.

    Here is a good place for an explanation of the syntax,
    and examples, and explanations of any options, etc.

    Program: our-demo-script
    Version: 1.0.0
    Created: 2016-01-14
    Updated: 2016-01-15
    License: GPL
    Contact: Our Name Here (example@example.com)
    END
