
!fn --shellpen-private contexts writeNullIfEmpty
!fn --shellpen-private contexts pop
!fn --shellpen-private writeDSL writeln "elif $*"
!fn --shellpen-private writeDSL writeln "then"
!fn --shellpen-private contexts push "fi"
