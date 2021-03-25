## $ DSL for
## > Begin a `for` loop

# Write the function
!fn --shellpen-private writeDSL writeln "for $*"
!fn --shellpen-private writeDSL writeln "do"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private contexts push "done"
