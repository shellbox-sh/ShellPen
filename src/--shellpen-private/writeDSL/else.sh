## $ DSL else
## > Add an `else` to an `if` conditional block

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "else"
!fn --shellpen-private writeDSL --push "fi"
