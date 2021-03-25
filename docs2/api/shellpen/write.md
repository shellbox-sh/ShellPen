---
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen write



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"write")
  local __shellpen__mainCliCommandDepth="2"
  __shellpen__mainCliCommands+=("$1")
  local __shellpen__mainCliCommands_command2="$1"
  shift
  case "$__shellpen__mainCliCommands_command2" in
{% endhighlight %}
{% raw %}

</details>








    
    
    
    
    

## [`shellpen write write`](#shellpen-write-write-1)

                  
    
    
    
    
    

## [`shellpen write writeln`](#shellpen-write-writeln-1)

                  
    
    
    
    
    

## [`shellpen write main`](#shellpen-write-main-1)

                  
    
    
    
    
    

## [`shellpen write comment`](#shellpen-write-comment-1)

                  
    
    
    
    
    

## [`shellpen write }`](#shellpen-write--1)

                  
    
    
    
    
    

## [`shellpen write function`](#shellpen-write-function-1)

                  
    
    
    
    
    

## [`shellpen write indent--`](#shellpen-write-indent---1)

                  
    
    
    
    
    

## [`shellpen write shebang`](#shellpen-write-shebang-1)

                  
    
    
    
    
    

## [`shellpen write return`](#shellpen-write-return-1)

                  
    
    
    
    
    

## [`shellpen write fi`](#shellpen-write-fi-1)

                  
    
    
    
    
    

## [`shellpen write option`](#shellpen-write-option-1)

                  
    
    
    
    
    

## [`shellpen write if`](#shellpen-write-if-1)

                  
    
    
    
    
    

## [`shellpen write shift`](#shellpen-write-shift-1)

                  
    
    
    
    
    

## [`shellpen write indentation`](#shellpen-write-indentation-1)

                  
    
    
    
    
    

## [`shellpen write fn`](#shellpen-write-fn-1)

                  
    
    
    
    
    

## [`shellpen write local`](#shellpen-write-local-1)

                  
    
    
    
    
    

## [`shellpen write case`](#shellpen-write-case-1)

                  
    
    
    
    
    

## [`shellpen write save`](#shellpen-write-save-1)

                  
    
    
    
    
    

## [`shellpen write indent++`](#shellpen-write-indent++-1)

                  
    
    
    
    
    

## [`shellpen write code`](#shellpen-write-code-1)

                  
    
    
    
    
    

## [`shellpen write esac`](#shellpen-write-esac-1)

                  
    
    
    
    
    

## [`shellpen write echo`](#shellpen-write-echo-1)

                  
    
    
    
    
    

## [`shellpen write else`](#shellpen-write-else-1)

                  
    
    
    
    
    

## [`shellpen write error`](#shellpen-write-error-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen write write`](/api/shellpen/write/write)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"write")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write writeln`](/api/shellpen/write/writeln)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"writeln")
  _SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]+="$( shellpen indentation )$*\n"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write main`](/api/shellpen/write/main)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"main")
  _SHELLPEN_MAIN_FUNCTION[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$1"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write comment`](/api/shellpen/write/comment)



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


                    
  
    

    
    

# [`shellpen write }`](/api/shellpen/write/})



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







                    
  
    

    
    

# [`shellpen write function`](/api/shellpen/write/function)



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







                    
  
    

    
    

# [`shellpen write indent--`](/api/shellpen/write/indent--)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent--")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} - 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write shebang`](/api/shellpen/write/shebang)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shebang")
  _SHELLPEN_SHEBANG[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$*"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write return`](/api/shellpen/write/return)



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







                    
  
    

    
    

# [`shellpen write fi`](/api/shellpen/write/fi)



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







                    
  
    

    
    

# [`shellpen write option`](/api/shellpen/write/option)



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







                    
  
    

    
    

# [`shellpen write if`](/api/shellpen/write/if)



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







                    
  
    

    
    

# [`shellpen write shift`](/api/shellpen/write/shift)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"shift")
  shellpen writeln shift
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write indentation`](/api/shellpen/write/indentation)



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







                    
  
    

    
    

# [`shellpen write fn`](/api/shellpen/write/fn)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"fn")
  shellpen function "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write local`](/api/shellpen/write/local)



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







                    
  
    

    
    

# [`shellpen write case`](/api/shellpen/write/case)



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







                    
  
    

    
    

# [`shellpen write save`](/api/shellpen/write/save)



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







                    
  
    

    
    

# [`shellpen write indent++`](/api/shellpen/write/indent++)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"indent++")
  _SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]="$(( ${_SHELLPEN_INDENT_LEVELS[$_SHELLPEN_CURRENT_SOURCE_INDEX]} + 1 ))"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write code`](/api/shellpen/write/code)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"code")
  shellpen result "$@"
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write esac`](/api/shellpen/write/esac)



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







                    
  
    

    
    

# [`shellpen write echo`](/api/shellpen/write/echo)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"echo")
  shellpen writeln "echo \"$*\""
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen write else`](/api/shellpen/write/else)



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







                    
  
    

    
    

# [`shellpen write error`](/api/shellpen/write/error)



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
