#! /usr/bin/env bash

# Private Variables
_SHELLPEN_CURRENT_SOURCE_INDEX=0
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_OPTION_OPEN=("")
_SHELLPEN_FUNCTION_OPEN=("")
_SHELLPEN_CASE_OPEN=("")
_SHELLPEN_MAIN_FUNCTION=("")
_SHELLPEN_SHEBANG=("#! /usr/bin/env bash")

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
        "alias")
          shopt -s expand_aliases
          alias "$1"=shellpen
  
            ;;
        "blocks")
            local __shellpen__mainCliCommandDepth="3"
            __shellpen__mainCliCommands+=("$1")
            local __shellpen__mainCliCommands_command3="$1"
            shift
            case "$__shellpen__mainCliCommands_command3" in
              "cases")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                        if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen esac
                        fi
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
            
                          ;;
                      "open")
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks cases' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
      
                  ;;
              "closeAll")
                shellpen -- blocks options close
                shellpen -- blocks cases close
                shellpen -- blocks functions close
      
                  ;;
              "functions")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                        if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen }
                        fi
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
            
                          ;;
                      "open")
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks functions' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
      
                  ;;
              "options")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      "close")
                        # Close existing option, if open
                        if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
                        then
                          shellpen writeln ";;"
                          shellpen indent--
                        fi
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
            
                          ;;
                      "open")
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks options' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
      
                  ;;
              *)
                echo "Unknown 'shellpen -- blocks' command: $__shellpen__mainCliCommands_command3" >&2
                return 1
                ;;
            esac
  
            ;;
        "dump")
          ( set -o posix; set ) | grep SHELLPEN
  
            ;;
        "writeMain")
          if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            shellpen writeln
            shellpen writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
          fi
          _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
  
            ;;
        "writeShebang")
          
          if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          fi
  
            ;;
        *)
          echo "Unknown 'shellpen --' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac

        ;;
    "case")
      shellpen writeln "case \"$1\" in"
      shellpen indent++
      shellpen -- blocks cases open

        ;;
    "code")
      shellpen result "$@"

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
      shellpen indent--
      shellpen writeln "esac"

        ;;
    "fi")
      shellpen indent--
      shellpen writeln "fi"

        ;;
    "fn")
      shellpen function "$@"

        ;;
    "function")
      shellpen writeln
      shellpen writeln "${1%()}() {"
      shellpen indent++
      shellpen -- blocks functions open

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
    "main")
      _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"

        ;;
    "option")
      shellpen -- blocks options close
      shellpen writeln "$1)"
      shellpen -- blocks options open
      shellpen indent++

        ;;
    "preview")
      shellpen result "$@"

        ;;
    "result")
      shellpen -- blocks closeAll
      shellpen -- writeMain
      shellpen -- writeShebang
      
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
      shellpen result > "$1"
      chmod +x "$1"

        ;;
    "-")
      shellpen -- alias -

        ;;
    ":")
      shellpen -- alias :

        ;;
    "_")
      shellpen -- alias _

        ;;
    "}")
      shellpen indent--
      shellpen writeln "}"
      _SHELLPEN_OPTION_OPEN[_SHELLPEN_CURRENT_SOURCE_INDEX]=false

        ;;
    "shebang")
      _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"

        ;;
    "shift")
      shellpen writeln shift

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

