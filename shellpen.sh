#! /usr/bin/env bash

_SHELLPEN_SHEBANG=("#! /usr/bin/env bash")

_SHELLPEN_PENS=("default")
_SHELLPEN_CURRENT_PEN_NAME="default"
_SHELLPEN_CURRENT_PEN_INDEX=0

_SHELLPEN_CURRENT_SOURCE_INDEX=0
_SHELLPEN_CURRENT_SOURCE_NAME="default"
_SHELLPEN_SOURCES=("default")
_SHELLPEN_SOURCECODE=("")
_SHELLPEN_SOURCES_FILE_PATHS=("")
_SHELLPEN_INDENT_LEVELS=(0)
_SHELLPEN_OPTION_OPEN=("")
_SHELLPEN_FUNCTION_OPEN=("")
_SHELLPEN_CASE_OPEN=("")
_SHELLPEN_MAIN_FUNCTION=("")

# Public Variables
[ -z "$SHELLPEN_INDENT" ] && SHELLPEN_INDENT="  "

## @command shellpen
shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
    ## @command shellpen --
    "--")
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        ## @command shellpen -- alias
        "alias")
          shopt -s expand_aliases
          alias "$1"=shellpen
        ## @
  
            ;;
        ## @command shellpen -- blocks
        "blocks")
            local __shellpen__mainCliCommandDepth="3"
            __shellpen__mainCliCommands+=("$1")
            local __shellpen__mainCliCommands_command3="$1"
            shift
            case "$__shellpen__mainCliCommands_command3" in
              ## @command shellpen -- blocks cases
              "cases")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      ## @command shellpen -- blocks cases close
                      "close")
                        if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen esac
                        fi
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      ## @command shellpen -- blocks cases open
                      "open")
                        _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks cases' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              ## @command shellpen -- blocks closeAll
              "closeAll")
                shellpen -- blocks options close
                shellpen -- blocks cases close
                shellpen -- blocks functions close
              ## @
      
                  ;;
              ## @command shellpen -- blocks functions
              "functions")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      ## @command shellpen -- blocks functions close
                      "close")
                        if [ "${_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
                        then
                          shellpen }
                        fi
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      ## @command shellpen -- blocks functions open
                      "open")
                        _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks functions' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              ## @command shellpen -- blocks options
              "options")
                    local __shellpen__mainCliCommandDepth="4"
                    __shellpen__mainCliCommands+=("$1")
                    local __shellpen__mainCliCommands_command4="$1"
                    shift
                    case "$__shellpen__mainCliCommands_command4" in
                      ## @command shellpen -- blocks options close
                      "close")
                        # Close existing option, if open
                        if [ "${_SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ]
                        then
                          shellpen writeln ";;"
                          shellpen indent--
                        fi
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
                      ## @
            
                          ;;
                      ## @command shellpen -- blocks options open
                      "open")
                        _SHELLPEN_OPTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=true
                      ## @
            
                          ;;
                      *)
                        echo "Unknown 'shellpen -- blocks options' command: $__shellpen__mainCliCommands_command4" >&2
                        return 1
                        ;;
                    esac
              ## @
      
                  ;;
              *)
                echo "Unknown 'shellpen -- blocks' command: $__shellpen__mainCliCommands_command3" >&2
                return 1
                ;;
            esac
        ## @
  
            ;;
        ## @command shellpen -- dump
        "dump")
          ( set -o posix; set ) | grep SHELLPEN
        ## @
  
            ;;
        ## @command shellpen -- errors
        "errors")
            local __shellpen__mainCliCommandDepth="3"
            __shellpen__mainCliCommands+=("$1")
            local __shellpen__mainCliCommands_command3="$1"
            shift
            case "$__shellpen__mainCliCommands_command3" in
              ## @command shellpen -- errors argumentError
              "argumentError")
                if [ $# -gt 0 ]
                then
                  printf '`shellpen` [Argument Error] ' >&2
                  printf "$@" >&2
                else
                  printf '`shellpen` [Argument Error]' >&2
                fi
                shellpen -- errors printStackTrace
              ## @
      
                  ;;
              ## @command shellpen -- errors getFileLine
              "getFileLine")
                ## $1 Path to the file
                ## $2 Line to print
                ##
                if [ "$2" = "0" ]
                then
                  sed "1q;d" "$1" | sed 's/^ *//g'
                else
                  sed "${2}q;d" "$1" | sed 's/^ *//g'
                fi
              ## @
      
                  ;;
              ## @command shellpen -- errors printStackTrace
              "printStackTrace")
                ## $1 (_Optional_) How many levels to skip (default: `2`)
                ## $2 (_Optional_) How many levels deep to show (default: `100`)
                
                local __shellpen__x_errors_printStackTrace_levelsToSkip="${1-3}"
                local __shellpen__x_errors_printStackTrace_levelsToShow="${2-100}"
                
                if [ "$SHELLPEN_SILENCE" != "true" ]
                then
                  echo >&2
                  echo >&2
                  echo "Stacktrace:" >&2
                  echo >&2
                  local __shellpen__i=1
                  local __shellpen__stackIndex="$__shellpen__x_errors_printStackTrace_levelsToSkip"
                  while [ $__shellpen__stackIndex -lt ${#BASH_SOURCE[@]} ] && [ $__shellpen__i -lt $__shellpen__x_errors_printStackTrace_levelsToShow ]
                  do
                    local __shellpen__errors_printStackTrace_line=''
                    __shellpen__errors_printStackTrace_line="$( echo "$(shellpen -- errors getFileLine "${BASH_SOURCE[$__shellpen__stackIndex]}" "${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]}")" | sed 's/^/    /' 2>&1 )"
                    # Catches sed errors
                    if [ $? -eq 0 ]
                    then
                      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$__shellpen__stackIndex]} ${FUNCNAME[$__shellpen__stackIndex]}():" >&2
                      echo "  $__shellpen__errors_printStackTrace_line" >&2
                    else
                      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$__shellpen__stackIndex]} ${FUNCNAME[$__shellpen__stackIndex]}()" >&2
                    fi
                    echo >&2
                    : "$(( __shellpen__stackIndex++ ))"
                    : "$(( __shellpen__i++ ))"
                  done
                fi
              ## @
      
                  ;;
              *)
                echo "Unknown 'shellpen -- errors' command: $__shellpen__mainCliCommands_command3" >&2
                return 1
                ;;
            esac
        ## @
  
            ;;
        ## @command shellpen -- writeMain
        "writeMain")
          if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            shellpen writeln
            shellpen writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
          fi
          _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
        ## @
  
            ;;
        ## @command shellpen -- writeShebang
        "writeShebang")
          
          if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
          then
            _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          fi
          _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen --' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    ## @command shellpen case
    "case")
      shellpen writeln "case \"$1\" in"
      shellpen indent++
      shellpen -- blocks cases open
    ## @

        ;;
    ## @command shellpen code
    "code")
      shellpen result "$@"
    ## @

        ;;
    ## @command shellpen comment
    "comment")
      ## $1 foo
      ## $@ stuff
      ##
      ## Some stuff about the comment
      ##
      ## Here come some params:
      ##
      ##
      ## Hello
      ##
      
      shellpen writeln "# $*"
    ## @

        ;;
    ## @command shellpen echo
    "echo")
      shellpen writeln "echo \"$*\""
    ## @

        ;;
    ## @command shellpen else
    "else")
      shellpen indent--
      shellpen writeln "else"
      shellpen indent++
    ## @

        ;;
    ## @command shellpen error
    "error")
      if [ $# -eq 1 ]
      then
        shellpen writeln echo \"$*\" '>&2'
        shellpen return 1
      else
        shellpen writeln printf $@ '>&2'
        shellpen return 1
      fi
    ## @

        ;;
    ## @command shellpen esac
    "esac")
      shellpen -- blocks options close
      _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
      # Close existing option, if open
      shellpen indent--
      shellpen writeln "esac"
    ## @

        ;;
    ## @command shellpen fi
    "fi")
      shellpen indent--
      shellpen writeln "fi"
    ## @

        ;;
    ## @command shellpen fn
    "fn")
      shellpen function "$@"
    ## @

        ;;
    ## @command shellpen function
    "function")
      shellpen writeln
      shellpen writeln "${1%()}() {"
      shellpen indent++
      shellpen -- blocks functions open
    ## @

        ;;
    ## @command shellpen if
    "if")
      shellpen writeln "if $*"
      shellpen writeln "then"
      shellpen indent++
    ## @

        ;;
    ## @command shellpen indentation
    "indentation")
      local __shellpen__indentation=""
      local __shellpen__indentationLevel=0
      while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
      do
        __shellpen__indentation+="$SHELLPEN_INDENT"
        : "$(( __shellpen__indentationLevel++ ))"
      done
      printf "$__shellpen__indentation"
    ## @

        ;;
    ## @command shellpen indent++
    "indent++")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
    ## @

        ;;
    ## @command shellpen indent--
    "indent--")
      _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
    ## @

        ;;
    ## @command shellpen local
    "local")
      if [ $# -eq 1 ]
      then
        if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
        then
          shellpen writeln "local ${1%%=*}=\"${1#*=}\""
        else
          shellpen writeln "local $*"
        fi
      elif [ $# -eq 2 ]
      then
        shellpen writeln "local $1=\"$2\""
      fi
    ## @

        ;;
    ## @command shellpen main
    "main")
      _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
    ## @

        ;;
    ## @command shellpen option
    "option")
      shellpen -- blocks options close
      shellpen writeln "$1)"
      shellpen -- blocks options open
      shellpen indent++
    ## @

        ;;
    ## @command shellpen pens
    "pens")
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        *)
          echo "Unknown 'shellpen pens' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    ## @command shellpen preview
    "preview")
      shellpen result "$@"
    ## @

        ;;
    ## @command shellpen result
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
    ## @

        ;;
    ## @command shellpen return
    "return")
      if [ $# -eq 1 ]
      then
        shellpen writeln "return $1"
      else
        shellpen writeln "return 1"
      fi
    ## @

        ;;
    ## @command shellpen save
    "save")
      shellpen result > "$1"
      chmod +x "$1"
    ## @

        ;;
    ## @command shellpen -
    "-")
      shellpen -- alias -
    ## @

        ;;
    ## @command shellpen :
    ":")
      shellpen -- alias :
    ## @

        ;;
    ## @command shellpen _
    "_")
      shellpen -- alias _
    ## @

        ;;
    ## @command shellpen }
    "}")
      shellpen indent--
      shellpen writeln "}"
      _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
    ## @

        ;;
    ## @command shellpen shebang
    "shebang")
      _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
    ## @

        ;;
    ## @command shellpen shift
    "shift")
      shellpen writeln shift
    ## @

        ;;
    ## @command shellpen sources
    "sources")
      local __shellpen__mainCliCommandDepth="2"
      __shellpen__mainCliCommands+=("$1")
      local __shellpen__mainCliCommands_command2="$1"
      shift
      case "$__shellpen__mainCliCommands_command2" in
        ## @command shellpen sources current
        "current")
          if [ -n "$1" ]
          then
            printf -v "$1" '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          else
            printf '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
          fi
        ## @
  
            ;;
        ## @command shellpen sources exists
        "exists")
          local __shellpen__sources_exists_sourceIndex=''
          for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
          do
            if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
            then
              if [ $# -eq 2 ]
              then
                printf -v "$2" "$__shellpen__sources_exists_sourceIndex" 
              fi
              return 0
            fi
          done
          return 1
        ## @
  
            ;;
        ## @command shellpen sources getFilePath
        "getFilePath")
          
        ## @
  
            ;;
        ## @command shellpen sources getSource
        "getSource")
          
        ## @
  
            ;;
        ## @command shellpen sources hasFilePath
        "hasFilePath")
          
        ## @
  
            ;;
        ## @command shellpen sources list
        "list")
          local __shellpen__sources_list_sourceName=''
          [ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
          for __shellpen__sources_list_sourceName in "${_SHELLPEN_SOURCES[@]}"
          do
            if [ $# -eq 2 ] && [ "$1" = "-" ]
            then
              eval "$2+=(\"\$__shellpen__sources_list_sourceName\")"
            else
              echo "$__shellpen__sources_list_sourceName"
            fi
          done
        ## @
  
            ;;
        ## @command shellpen sources new
        "new")
          ## $ sources new
          ##
          ## $1 Optional source name (else randomly generated)
          ## $2 Optional path to file for this source to represent
          ## $@ If `-` provided, following array argument will be cleared and appended with source names.
          ##
          ## ### Valid signatures:
          ##
          ## - [1] name
          ## - [2] name -
          ## - [2] name filePath
          ## - [2] - varName
          ## - [3] name filePath -
          ## - [3] name - varName
          ## - [4] name filePath - varName
          
          local __shellpen__sources_new_newSourceName=''
          local __shellpen__sources_new_sourceFilePath=''
          local __shellpen__sources_new_shouldOutputName=false
          local __shellpen__sources_new_outputVariableName=''
          
          if [ $# -eq 1 ]
          then
            __shellpen__sources_new_newSourceName="$1"
          elif [ $# -eq 2 ]
          then
            if [ "$1" = '-' ]
            then
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$2"
            elif [ "$2" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_outputVariableName="$1"
              __shellpen__sources_new_shouldOutputName=true
            else
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
            fi
          elif [ $# -eq 3 ]
          then
            if [ "$2" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$2"
            elif [ "$3" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$1"
            else
              shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          elif [ $# -eq 4 ]
          then
            if [ "$3" = '-' ]
            then
              __shellpen__sources_new_newSourceName="$1"
              __shellpen__sources_new_sourceFilePath="$2"
              __shellpen__sources_new_shouldOutputName=true
              __shellpen__sources_new_outputVariableName="$4"
            else
              shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          # if output variable, verify that it's a valid looking variable name, yo
          
          if shellpen sources exists "$__shellpen__sources_new_newSourceName"
          then
            shellpen -- errors argumentError '%s\n%s' "Source '$__shellpen__sources_new_newSourceName' already exists" "Command: ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
          
          [ -z "$__shellpen__sources_new_newSourceName" ] && __shellpen__sources_new_newSourceName="$( cat /dev/urandom | base64 | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1 )"
          
          if [ "$__shellpen__sources_new_shouldOutputName" = true ]
          then
            printf -v "$__shellpen__sources_new_outputVariableName" '%s' "$__shellpen__sources_new_newSourceName" 
          fi
          
          if [ -z "$__shellpen__sources_new_sourceFilePath" ]
          then
            _SHELLPEN_SOURCES_FILE_PATHS+=("$__shellpen__sources_new_sourceFilePath")
          fi
          
          _SHELLPEN_SOURCES+=("$__shellpen__sources_new_newSourceName")
          _SHELLPEN_SOURCECODE+=("")
          _SHELLPEN_INDENT_LEVELS+=(0)
          _SHELLPEN_OPTION_OPEN+=("")
          _SHELLPEN_FUNCTION_OPEN+=("")
          _SHELLPEN_CASE_OPEN+=("")
          _SHELLPEN_MAIN_FUNCTION+=("")
        ## @
  
            ;;
        ## @command shellpen sources use
        "use")
          if [ $# -eq 1 ]
          then
            local __shellpen__sources_use_sourceIndex=''
            if shellpen sources exists "$1" __shellpen__sources_use_sourceIndex
            then
              _SHELLPEN_CURRENT_SOURCE_INDEX="$__shellpen__sources_use_sourceIndex"
            else
              shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: ${__shellpen__originalCliCommands[*]}"
              return 1
            fi
          else
            shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
            return 1
          fi
        ## @
  
            ;;
        *)
          echo "Unknown 'shellpen sources' command: $__shellpen__mainCliCommands_command2" >&2
          return 1
          ;;
      esac
    ## @

        ;;
    ## @command shellpen writeln
    "writeln")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"
    ## @

        ;;
    ## @command shellpen write
    "write")
      _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
    ## @

        ;;
    *)
      echo "Unknown 'shellpen' command: $__shellpen__mainCliCommands_command1" >&2
      ;;
  esac

}

[ "${BASH_SOURCE[0]}" = "$0" ] && "shellpen" "$@"

