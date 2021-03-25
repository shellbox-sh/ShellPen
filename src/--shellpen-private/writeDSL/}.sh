## $ DSL }
## > Closes a function or an open `{` block

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "}"
