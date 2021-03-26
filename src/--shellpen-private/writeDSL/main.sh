## $ DSL main
## > Write a 'main' execution statement for provided function

!fn --shellpen-private writeDSL writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"$1\" \"\$@\""
