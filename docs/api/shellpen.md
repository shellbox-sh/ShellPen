---
---

{% raw %}










<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen() {
  declare -a __shellpen__mainCliCommands=("shellpen")
  declare -a __shellpen__originalCliCommands=("$@")

  local __shellpen__mainCliCommandDepth="1"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command1="$1"
  shift
  case "$__shellpen__mainCliCommands_command1" in
{% endhighlight %}
{% raw %}

</details>








    
    
    
    
    

## [`shellpen write`](#shellpen-write-1)

                  
    
    
    
    
    

## [`shellpen writeln`](#shellpen-writeln-1)

                  
    
    
    
    
    

## [`shellpen main`](#shellpen-main-1)

                  
    
    
    
    
    

## [`shellpen comment`](#shellpen-comment-1)

                  
    
    
    
    
    

## [`shellpen }`](#shellpen--1)

                  
    
    
    
    
    

## [`shellpen function`](#shellpen-function-1)

                  
    
    
    
    
    

## [`shellpen indent--`](#shellpen-indent---1)

                  
    
    
    
    
    

## [`shellpen shebang`](#shellpen-shebang-1)

                  
    
    
    
    
    

## [`shellpen return`](#shellpen-return-1)

                  
    
    
    
    
    

## [`shellpen fi`](#shellpen-fi-1)

                  
    
    
    
    
    

## [`shellpen preview`](#shellpen-preview-1)

                  
    
    
    
    
    

## [`shellpen option`](#shellpen-option-1)

                  
    
    
    
    
    

## [`shellpen if`](#shellpen-if-1)

                  
    
    
    
    
    

## [`shellpen shift`](#shellpen-shift-1)

                  
    
    
    
    
    

## [`shellpen sources`](#shellpen-sources-1)

                      
        
        
        
        

- [`shellpen sources use`](#shellpen-sources-use)
          
        
        
        
        

- [`shellpen sources getFilePath`](#shellpen-sources-getfilepath)
          
        
        
        
        

- [`shellpen sources current`](#shellpen-sources-current)
          
        
        
        
        

- [`shellpen sources new`](#shellpen-sources-new)
          
        
        
        
        

- [`shellpen sources list`](#shellpen-sources-list)
          
        
        
        
        

- [`shellpen sources exists`](#shellpen-sources-exists)
          
        
        
        
        

- [`shellpen sources getSource`](#shellpen-sources-getsource)
          
        
        
        
        

- [`shellpen sources hasFilePath`](#shellpen-sources-hasfilepath)
      
    
    
    
    
    

## [`shellpen indentation`](#shellpen-indentation-1)

                  
    
    
    
    
    

## [`shellpen fn`](#shellpen-fn-1)

                  
    
    
    
    
    

## [`shellpen local`](#shellpen-local-1)

                  
    
    
    
    
    

## [`shellpen case`](#shellpen-case-1)

                  
    
    
    
    
    

## [`shellpen save`](#shellpen-save-1)

                  
    
    
    
    
    

## [`shellpen indent++`](#shellpen-indent++-1)

                  
    
    
    
    
    

## [`shellpen :`](#shellpen--2)

                  
    
    
    
    
    

## [`shellpen code`](#shellpen-code-1)

                  
    
    
    
    
    

## [`shellpen -`](#shellpen---1)

                  
    
    
    
    
    

## [`shellpen esac`](#shellpen-esac-1)

                  
    
    
    
    
    

## [`shellpen result`](#shellpen-result-1)

                  
    
    
    
    
    

## [`shellpen --`](#shellpen----1)

                      
        
        
        
        

- [`shellpen -- dump`](#shellpen----dump)
          
        
        
        
        

- [`shellpen -- alias`](#shellpen----alias)
          
        
        
        
        

- [`shellpen -- errors`](#shellpen----errors)
          
        
        
        
        

- [`shellpen -- writeMain`](#shellpen----writemain)
          
        
        
        
        

- [`shellpen -- blocks`](#shellpen----blocks)
          
        
        
        
        

- [`shellpen -- writeShebang`](#shellpen----writeshebang)
      
    
    
    
    
    

## [`shellpen pens`](#shellpen-pens-1)

                  
    
    
    
    
    

## [`shellpen _`](#shellpen-_-1)

                  
    
    
    
    
    

## [`shellpen echo`](#shellpen-echo-1)

                  
    
    
    
    
    

## [`shellpen else`](#shellpen-else-1)

                  
    
    
    
    
    

## [`shellpen error`](#shellpen-error-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen write`](/api/shellpen/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"write")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen writeln`](/api/shellpen/writeln)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeln")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen main`](/api/shellpen/main)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"main")
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen comment`](/api/shellpen/comment)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"comment")

shellpen writeln "# $*"
{% endhighlight %}
{% raw %}

</details>



| | Description |
|-|-------------|
| `$1` | foo |
| `$@` | stuff |




Some stuff about the comment

Here come some params:


Hello


                    
  
    

    
    

# [`shellpen }`](/api/shellpen/})



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"}")
  shellpen indent--
  shellpen writeln "}"
  _SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen function`](/api/shellpen/function)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"function")
  shellpen writeln
  shellpen writeln "${1%()}() {"
  shellpen indent++
  shellpen -- blocks functions open
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen indent--`](/api/shellpen/indent--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent--")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen shebang`](/api/shellpen/shebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shebang")
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen return`](/api/shellpen/return)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"return")
  if [ $# -eq 1 ]
  then
    shellpen writeln "return $1"
  else
    shellpen writeln "return 1"
  fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen fi`](/api/shellpen/fi)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"fi")
  shellpen indent--
  shellpen writeln "fi"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen preview`](/api/shellpen/preview)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"preview")
  shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen option`](/api/shellpen/option)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"option")
  shellpen -- blocks options close
  shellpen writeln "$1)"
  shellpen -- blocks options open
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen if`](/api/shellpen/if)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"if")
  shellpen writeln "if $*"
  shellpen writeln "then"
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen shift`](/api/shellpen/shift)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shift")
  shellpen writeln shift
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen sources`](/api/shellpen/sources)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"sources")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen sources use`](/api/shellpen/sources/use)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources getFilePath`](/api/shellpen/sources/getFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getFilePath")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources current`](/api/shellpen/sources/current)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"current")
  if [ -n "$1" ]
  then
    printf -v "$1" '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  else
    printf '%s' "${_SHELLPEN_SOURCES[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources new`](/api/shellpen/sources/new)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"new")
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources list`](/api/shellpen/sources/list)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources exists`](/api/shellpen/sources/exists)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources getSource`](/api/shellpen/sources/getSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"getSource")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen sources hasFilePath`](/api/shellpen/sources/hasFilePath)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"hasFilePath")
  
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen indentation`](/api/shellpen/indentation)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indentation")
  local __shellpen__indentation=""
  local __shellpen__indentationLevel=0
  while [ $__shellpen__indentationLevel -lt "${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  do
    __shellpen__indentation+="$SHELLPEN_INDENT"
    : "$(( __shellpen__indentationLevel++ ))"
  done
  printf "$__shellpen__indentation"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen fn`](/api/shellpen/fn)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"fn")
  shellpen function "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen local`](/api/shellpen/local)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen case`](/api/shellpen/case)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"case")
  shellpen writeln "case \"$1\" in"
  shellpen indent++
  shellpen -- blocks cases open
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen save`](/api/shellpen/save)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"save")
  shellpen result > "$1"
  chmod +x "$1"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen indent++`](/api/shellpen/indent++)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent++")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen :`](/api/shellpen/colon)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
":")
  shellpen -- alias :
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen code`](/api/shellpen/code)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"code")
  shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -`](/api/shellpen/-)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"-")
  shellpen -- alias -
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen esac`](/api/shellpen/esac)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"esac")
  shellpen -- blocks options close
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
  # Close existing option, if open
  shellpen indent--
  shellpen writeln "esac"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen result`](/api/shellpen/result)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen --`](/api/shellpen/--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"--")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>







                      
        
        
        

## [`shellpen -- dump`](/api/shellpen/--/dump)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"dump")
  ( set -o posix; set ) | grep SHELLPEN
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- alias`](/api/shellpen/--/alias)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"alias")
  shopt -s expand_aliases
  alias "$1"=shellpen
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- errors`](/api/shellpen/--/errors)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"errors")
    local __shellpen__mainCliCommandDepth="3"
    __shellpen__mainCliCommands+=("$1")
    local __shellpen__mainCliCommands_command3="$1"
    shift
    case "$__shellpen__mainCliCommands_command3" in
{% endhighlight %}
{% raw %}

</details>







    
    

                              
        

- [`shellpen -- errors argumentError`](/api/shellpen/--/errors/argumentError)
                          
        

- [`shellpen -- errors printStackTrace`](/api/shellpen/--/errors/printStackTrace)
                          
        

- [`shellpen -- errors getFileLine`](/api/shellpen/--/errors/getFileLine)
    
                
        
        
        

## [`shellpen -- writeMain`](/api/shellpen/--/writeMain)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeMain")
  if [ -n "${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    shellpen writeln
    shellpen writeln "[ \"\${BASH_SOURCE[0]}\" = \"\$0\" ] && \"${_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\" \"\$@\""
  fi
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>







    
    

        
                
        
        
        

## [`shellpen -- blocks`](/api/shellpen/--/blocks)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"blocks")
    local __shellpen__mainCliCommandDepth="3"
    __shellpen__mainCliCommands+=("$1")
    local __shellpen__mainCliCommands_command3="$1"
    shift
    case "$__shellpen__mainCliCommands_command3" in
{% endhighlight %}
{% raw %}

</details>







    
    

                              
        

- [`shellpen -- blocks functions`](/api/shellpen/--/blocks/functions)
                          
        

- [`shellpen -- blocks closeAll`](/api/shellpen/--/blocks/closeAll)
                          
        

- [`shellpen -- blocks options`](/api/shellpen/--/blocks/options)
                          
        

- [`shellpen -- blocks cases`](/api/shellpen/--/blocks/cases)
    
                
        
        
        

## [`shellpen -- writeShebang`](/api/shellpen/--/writeShebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeShebang")
  
  if [ -n "${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" ]
  then
    _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]="${_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]}\n${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]=""
{% endhighlight %}
{% raw %}

</details>







    
    

        
              
  
    

    
    

# [`shellpen pens`](/api/shellpen/pens)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
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
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen _`](/api/shellpen/_)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"_")
  shellpen -- alias _
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen echo`](/api/shellpen/echo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"echo")
  shellpen writeln "echo \"$*\""
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen else`](/api/shellpen/else)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"else")
  shellpen indent--
  shellpen writeln "else"
  shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen error`](/api/shellpen/error)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"error")
  if [ $# -eq 1 ]
  then
    shellpen writeln echo \"$*\" '>&2'
    shellpen return 1
  else
    shellpen writeln printf $@ '>&2'
    shellpen return 1
  fi
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
