## $ DSL while
## > Begin a `while` loop

!fn --shellpen-private writeDSL writeln "while $*"
!fn --shellpen-private writeDSL writeln "do"
!fn --shellpen-private writeDSL --push "done"
