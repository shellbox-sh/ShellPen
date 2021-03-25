## $ DSL done
## > End a `for` or `while` loop

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "done"
