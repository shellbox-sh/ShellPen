# [ $# -ne 1 ] && { echo "fn: requires one argument [function name]" >&2; return 1; }

local functionName="$1"

# [[ "$functionName" =~ ([^\(]+)\([[:space:]]*\)[[:space:]]*[\{]* ]] && functionName="${BASH_REMATCH[1]}"

# Write the function
!fn --shellpen-private writeDSL writeln "$functionName() {"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private contexts push "}"