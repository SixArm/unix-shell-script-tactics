# Trap

Trap signals, such as user pressing CTRL-C, and call an exit function.

    exit() {
      # Do any cleanup here, such as closing open files,
      # deleting temp data, or printing results.
    }

    trap exit EXIT
    
Use `trap "..." EXIT` instead of TERM, INT, HUP, etc.
