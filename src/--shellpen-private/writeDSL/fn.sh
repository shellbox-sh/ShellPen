## $ DSL fn
## > Begin a `function` definition block

local functionName="$1"

# Write the function
!fn --shellpen-private writeDSL writeln "$functionName() {"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private writeDSL --push "}"
