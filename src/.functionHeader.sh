SHELLPEN_ROOT="${SHELLPEN_ROOT:-$HOME/.shellpen}"

if [ -z "${SHELLPEN_MODE+x}" ]
then
  if [ "${BASH_SOURCE[0]}" = "$0" ]
  then
    SHELLPEN_MODE=executable
  else
    SHELLPEN_MODE=library
  fi
else
  if [ "${BASH_SOURCE[0]}" = "$0" ] && [ "$SHELLPEN_MODE" = library ]
  then
    # TODO change all to use compiler errors when possible...
    echo "Cannot configure ShellPen mode to 'library' when running as an executable" >&2
    return 1
  fi
fi