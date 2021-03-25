## $ DSL ::
## > Write a `;;` for use in `case`/`esac` `option`s

!fn --shellpen-private writeDSL --write-null-if-last-empty
!fn --shellpen-private writeDSL writeln ";;"
!fn --shellpen-private writeDSL --pop
