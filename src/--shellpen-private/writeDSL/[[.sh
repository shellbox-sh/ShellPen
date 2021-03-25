## $ DSL [[
## > Starts a line with a `[[` statement, e.g. `[[ '"$1"' =~ ^-- ]] AND ...`

!fn --shellpen-private writeDSL writeln "[[ $*"
