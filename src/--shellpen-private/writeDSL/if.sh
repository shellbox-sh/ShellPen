## $ DSL if
## > Begin an `if` conditional block

# Write the function
!fn --shellpen-private writeDSL writeln "if $*"
!fn --shellpen-private writeDSL writeln "then"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private writeDSL --push "fi"
