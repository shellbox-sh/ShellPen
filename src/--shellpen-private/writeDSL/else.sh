## $ DSL else
## > Add an `else` to an `if` conditional block

!fn --shellpen-private contexts writeNullIfEmpty
!fn --shellpen-private contexts pop
!fn --shellpen-private writeDSL writeln "else"
!fn --shellpen-private contexts push "fi"
