## $ DSL case
## > Begin a `case` / `esac` statement

!fn --shellpen-private writeDSL writeln "case \"$1\" in"
!fn --shellpen-private contexts push "esac"
