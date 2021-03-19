# local __shellpen__append_appendln_newLine=$'\n'

if [ -n "$SHELLPEN_PEN" ]
then
  FN pens putAway "$SHELLPEN_PEN" "$@"
else
  FN -- errors argumentError '%s\n%s' "\`append putAway\` can only be called by a Pen, try \`FN pens putAway [name]\` instead" "Command: FN ${__FN__originalCliCommands[*]}"
  return 1
fi