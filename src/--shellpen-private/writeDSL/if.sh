# Write the function
!fn --shellpen-private writeDSL writeln "if $*"
!fn --shellpen-private writeDSL writeln "then"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private contexts push "fi"