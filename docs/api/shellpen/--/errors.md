---
title: "shellpen -- errors"
---

{% raw %}





[🔙 Back to shellpen --](/api/shellpen/--)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- errors



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="3"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command3="$1"
shift
case "$__shellpen__mainCliCommands_command3" in
  "argumentError")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen -- errors argumentError`](#shellpen----errors-argumenterror-1)

                  
    
    
    
    
    

## [`shellpen -- errors printStackTrace`](#shellpen----errors-printstacktrace-1)

                  
    
    
    
    
    

## [`shellpen -- errors getFileLine`](#shellpen----errors-getfileline-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen -- errors argumentError`](/api/shellpen/--/errors/argumentError)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -gt 0 ]
then
  printf '`shellpen` [Argument Error] ' >&2
  printf "$@" >&2
else
  printf '`shellpen` [Argument Error]' >&2
fi
shellpen -- errors printStackTrace
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen -- errors printStackTrace`](/api/shellpen/--/errors/printStackTrace)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

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
      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]} ${FUNCNAME[$__shellpen__stackIndex]}():" >&2
      echo "  $__shellpen__errors_printStackTrace_line" >&2
    else
      echo "${BASH_SOURCE[$__shellpen__stackIndex]}:${BASH_LINENO[$(( __shellpen__stackIndex - 1 ))]} ${FUNCNAME[$__shellpen__stackIndex]}()" >&2
    fi
    echo >&2
    : "$(( __shellpen__stackIndex++ ))"
    : "$(( __shellpen__i++ ))"
  done
fi
{% endhighlight %}
{% raw %}

</details>



| | Description |
|-|-------------|
| `$1` | (_Optional_) How many levels to skip (default: `2`) |
| `$2` | (_Optional_) How many levels deep to show (default: `100`) |





                    
  
    

    
    

# [`shellpen -- errors getFileLine`](/api/shellpen/--/errors/getFileLine)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ "$2" = "0" ]
then
  sed "1q;d" "$1" | sed 's/^ *//g'
else
  sed "${2}q;d" "$1" | sed 's/^ *//g'
fi
{% endhighlight %}
{% raw %}

</details>



| | Description |
|-|-------------|
| `$1` | Path to the file |
| `$2` | Line to print |






                    
      
{% endraw %}
