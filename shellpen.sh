#! /usr/bin/env bash

# Private Variables
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_CURRENT_INDEX=0

# Public Variables
[ -z "$SHELLPEN_INDENT" ] && SHELLPEN_INDENT="  "

shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
    "--")
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        *)
          echo "Unknown 'shellpen --' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac

        ;;
    "comment")
      shellpen writeln "# $*"

        ;;
    "echo")
      shellpen writeln "echo \"$*\""

        ;;
    "else")
      shellpen indent--
      shellpen writeln "else"
      shellpen indent++

        ;;
    "fi")
      shellpen indent--
      shellpen writeln "fi"

        ;;
    "function")
      shellpen writeln
      shellpen writeln "$1() {"
      shellpen indent++

        ;;
    "if")
      shellpen writeln "if $*"
      shellpen writeln "then"
      shellpen indent++

        ;;
    "indentation")
      local __shellpen__indentation=""
      local __shellpen__indentationLevel=0
      while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]}" ]
      do
        __shellpen__indentation+="$SHELLPEN_INDENT"
        : "$(( __shellpen__indentationLevel++ ))"
      done
      printf "$__shellpen__indentation"

        ;;
    "indent++")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]} + 1 ))"

        ;;
    "indent--")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_INDEX]} - 1 ))"

        ;;
    "result")
      if [ "$1" = "-n" ]
      then
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]}" | cat -n
      else
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]}"
      fi

        ;;
    "save")
      

        ;;
    "}")
      shellpen indent--
      shellpen writeln "}"

        ;;
    "writeln")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]+="$( shellpen indentation )$*\n"

        ;;
    "write")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_INDEX]+="$( shellpen indentation )$*"

        ;;
    *)
      echo "Unknown 'shellpen' command: $__shellpen__mainCliCommands_command1" >&2
      return 1
      ;;
  esac

}

[ "${BASH_SOURCE[0]}" = "$0" ] && "shellpen" "$@"

