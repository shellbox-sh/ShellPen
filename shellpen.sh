#! /usr/bin/env bash

# Private Variables
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_OPTION_OPEN=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_CURRENT_SOURCE_INDEX=0

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
    "case")
      shellpen writeln "case $1 in"
      shellpen indent++

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
    "error")
      if [ $# -eq 1 ]
      then
        shellpen writeln echo \"$*\" '>&2'
        shellpen return 1
      else
        shellpen writeln printf $@ '>&2'
        shellpen return 1
      fi

        ;;
    "esac")
      # Close existing option, if open
      if [ "${_SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
      then
        shellpen writeln ";;"
        _SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]=false
      fi
      
      shellpen indent--
      shellpen indent--
      shellpen writeln "esac"

        ;;
    "fi")
      shellpen indent--
      shellpen writeln "fi"

        ;;
    "function")
      shellpen writeln
      shellpen writeln "${1%()}() {"
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
      while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
      do
        __shellpen__indentation+="$SHELLPEN_INDENT"
        : "$(( __shellpen__indentationLevel++ ))"
      done
      printf "$__shellpen__indentation"

        ;;
    "indent++")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"

        ;;
    "indent--")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"

        ;;
    "local")
      if [ $# -eq 1 ]
      then
        if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
        then
          shellpen writeln "local $1"
        else
          shellpen writeln "local $*"
        fi
      elif [ $# -eq 2 ]
      then
        shellpen writeln "local $1=$2"
      fi

        ;;
    "option")
      # Close existing option, if open
      if [ "${_SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
      then
        shellpen writeln ";;"
        shellpen indent--
      fi
      
      shellpen writeln "$1)"
      shellpen indent++
      
      _SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]=true

        ;;
    "result")
      if [ "$1" = "-n" ]
      then
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
      else
        echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
      fi

        ;;
    "return")
      if [ $# -eq 1 ]
      then
        shellpen writeln "return $1"
      else
        shellpen writeln "return 1"
      fi

        ;;
    "save")
      echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" > "$1"

        ;;
    "}")
      shellpen indent--
      shellpen writeln "}"

        ;;
    "writeln")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"

        ;;
    "write")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"

        ;;
    *)
      echo "Unknown 'shellpen' command: $__shellpen__mainCliCommands_command1" >&2
      return 1
      ;;
  esac

}

[ "${BASH_SOURCE[0]}" = "$0" ] && "shellpen" "$@"

