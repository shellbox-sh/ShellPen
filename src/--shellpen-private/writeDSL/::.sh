## $ DSL ::
## > Writes a ';;' for use in `case`/`esac` `option`s

!fn --shellpen-private contexts writeNullIfEmpty
!fn --shellpen-private writeDSL writeln ";;"
!fn --shellpen-private contexts pop
