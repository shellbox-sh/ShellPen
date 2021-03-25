## $ DSL $
## > Run any arbitrary command
## $* Command name and arguments
## @example
##   - echo "Hello" \| $ sed "'s/foo/bar'"
## @example output
##   echo "Hello" | sed 's/foo/bar'
## @example Different
##   - echo "Hello FOO BAR" \| $ sed "'s/foo/bar'"
## @example Different output
##   echo "Hello FOO BAR" | sed 's/foo/bar'
##
## You must supply your own quotations.

!fn --shellpen-private writeDSL writeln "$@"
