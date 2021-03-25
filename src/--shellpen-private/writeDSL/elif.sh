## $ DSL elif
## > Add an `elif` to an `if` conditional block

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL --pop
!fn --shellpen-private writeDSL writeln "elif $*"
!fn --shellpen-private writeDSL writeln "then"
!fn --shellpen-private writeDSL --push "fi"
