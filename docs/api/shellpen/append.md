---
title: "shellpen append"
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "case")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen append write`](#shellpen-append-write-1)

                  
    
    
    
    
    

## [`shellpen append writeln`](#shellpen-append-writeln-1)

                  
    
    
    
    
    

## [`shellpen append main`](#shellpen-append-main-1)

                  
    
    
    
    
    

## [`shellpen append comment`](#shellpen-append-comment-1)

                  
    
    
    
    
    

## [`shellpen append }`](#shellpen-append--1)

                  
    
    
    
    
    

## [`shellpen append function`](#shellpen-append-function-1)

                  
    
    
    
    
    

## [`shellpen append indent--`](#shellpen-append-indent---1)

                  
    
    
    
    
    

## [`shellpen append shebang`](#shellpen-append-shebang-1)

                  
    
    
    
    
    

## [`shellpen append return`](#shellpen-append-return-1)

                  
    
    
    
    
    

## [`shellpen append fi`](#shellpen-append-fi-1)

                  
    
    
    
    
    

## [`shellpen append option`](#shellpen-append-option-1)

                  
    
    
    
    
    

## [`shellpen append if`](#shellpen-append-if-1)

                  
    
    
    
    
    

## [`shellpen append shift`](#shellpen-append-shift-1)

                  
    
    
    
    
    

## [`shellpen append fn`](#shellpen-append-fn-1)

                  
    
    
    
    
    

## [`shellpen append local`](#shellpen-append-local-1)

                  
    
    
    
    
    

## [`shellpen append case`](#shellpen-append-case-1)

                  
    
    
    
    
    

## [`shellpen append save`](#shellpen-append-save-1)

                  
    
    
    
    
    

## [`shellpen append indent++`](#shellpen-append-indent++-1)

                  
    
    
    
    
    

## [`shellpen append code`](#shellpen-append-code-1)

                  
    
    
    
    
    

## [`shellpen append esac`](#shellpen-append-esac-1)

                  
    
    
    
    
    

## [`shellpen append echo`](#shellpen-append-echo-1)

                  
    
    
    
    
    

## [`shellpen append switchTo`](#shellpen-append-switchto-1)

                  
    
    
    
    
    

## [`shellpen append else`](#shellpen-append-else-1)

                  
    
    
    
    
    

## [`shellpen append error`](#shellpen-append-error-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen append write`](/api/shellpen/append/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_write_sourceIndex=''
  if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_write_sourceIndex
  then
    shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_write_sourceIndex]+="$( shellpen indentation )$*"
  fi
else
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append writeln`](/api/shellpen/append/writeln)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__append_writeln_newLine=$'\n'
if [ -n "$SHELLPEN_SOURCE" ]
then
  local __shellpen__append_writeln_sourceIndex=''
  if ! shellpen -- getSourceIndex "$SHELLPEN_SOURCE" - __shellpen__append_writeln_sourceIndex
  then
    shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  else
    _SHELLPEN_SOURCECODE[$__shellpen__append_writeln_sourceIndex]+="$( shellpen indentation )$*${__shellpen__append_writeln_newLine}"
  fi
else
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*${__shellpen__append_writeln_newLine}"
fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append main`](/api/shellpen/append/main)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append comment`](/api/shellpen/append/comment)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

shellpen append writeln "# $*"
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


                    
  
    

    
    

# [`shellpen append }`](/api/shellpen/append/})



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "}"
_SHELLPEN_FUNCTION_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append function`](/api/shellpen/append/function)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln
shellpen append writeln "${1%()}() {"
shellpen indent++
shellpen -- blocks functions open
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append indent--`](/api/shellpen/append/indent--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append shebang`](/api/shellpen/append/shebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append return`](/api/shellpen/append/return)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  shellpen append writeln "return $1"
else
  shellpen append writeln "return 1"
fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append fi`](/api/shellpen/append/fi)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "fi"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append option`](/api/shellpen/append/option)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
shellpen append writeln "$1)"
shellpen -- blocks options open
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append if`](/api/shellpen/append/if)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "if $*"
shellpen append writeln "then"
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append shift`](/api/shellpen/append/shift)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln shift
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append fn`](/api/shellpen/append/fn)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen function "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append local`](/api/shellpen/append/local)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    shellpen append writeln "local ${1%%=*}=\"${1#*=}\""
  else
    shellpen append writeln "local $*"
  fi
elif [ $# -eq 2 ]
then
  shellpen append writeln "local $1=\"$2\""
fi
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append case`](/api/shellpen/append/case)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "case \"$1\" in"
shellpen indent++
shellpen -- blocks cases open
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append save`](/api/shellpen/append/save)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen result > "$1"
chmod +x "$1"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append indent++`](/api/shellpen/append/indent++)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append code`](/api/shellpen/append/code)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append esac`](/api/shellpen/append/esac)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- blocks options close
_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
# Close existing option, if open
shellpen indent--
shellpen append writeln "esac"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append echo`](/api/shellpen/append/echo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen append writeln "echo \"$*\""
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append switchTo`](/api/shellpen/append/switchTo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

if [ $# -eq 1 ]
then
  if [ -z "$SHELLPEN_PEN" ]
  then
    shellpen -- errors argumentError '%s\n%s' "Please do not call 'append switchTo' directly, call it via a pen function (this function requires setting \$SHELLPEN_PEN=\"[pen name]\" which is done automatically when using a pen function)" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  fi
  if shellpen sources exists "$1"
  then
    local __shellpen__append_switchTo_penIndex=''
    shellpen -- getPenIndex "$SHELLPEN_PEN" - __shellpen__append_switchTo_penIndex
    _SHELLPEN_PEN_SOURCES["$__shellpen__append_switchTo_penIndex"]="$1"
  else
    shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  fi
else
  shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi
{% endhighlight %}
{% raw %}

</details>





> Switch pen to write to a different source

$1 Name of the source to switch to


                    
  
    

    
    

# [`shellpen append else`](/api/shellpen/append/else)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen indent--
shellpen append writeln "else"
shellpen indent++
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen append error`](/api/shellpen/append/error)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  shellpen append writeln echo \"$*\" '>&2'
  shellpen return 1
else
  shellpen append writeln printf $@ '>&2'
  shellpen return 1
fi
{% endhighlight %}
{% raw %}

</details>







                    
      
{% endraw %}
