---
title: "shellpen pens"
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen pens



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__mainCliCommandDepth="2"
__shellpen__mainCliCommands+=("$1")
local __shellpen__mainCliCommands_command2="$1"
shift
case "$__shellpen__mainCliCommands_command2" in
  "exists")
{% endhighlight %}
{% raw %}

</details>










    
    
    
    
    

## [`shellpen pens new`](#shellpen-pens-new-1)

                  
    
    
    
    
    

## [`shellpen pens list`](#shellpen-pens-list-1)

                  
    
    
    
    
    

## [`shellpen pens exists`](#shellpen-pens-exists-1)

                  
    
    
    
    
    

## [`shellpen pens getSource`](#shellpen-pens-getsource-1)

                  
    
    
    
    
    

## [`shellpen pens switchSource`](#shellpen-pens-switchsource-1)

                  


# 📓 Command Reference


    

    
    

# [`shellpen pens new`](/api/shellpen/pens/new)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

local __shellpen__pens_new_penName=''
local __shellpen__pens_new_sourceName=''
local __shellpen__pens_new_createAlias=true
local __shellpen__pens_new_aliasName=''

if [ $# -eq 1 ]
then
  __shellpen__pens_new_penName="$1"
elif [ $# -eq 2 ] && [ "$2" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_createalias=false
elif [ $# -eq 2 ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_aliasName="$3"
elif [ $# -eq 3 ] && [ "$3" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
  __shellpen__pens_new_createalias=false
elif [ $# -eq 4 ] && [ "$3" = '-' ]
then
  __shellpen__pens_new_penName="$1"
  __shellpen__pens_new_sourceName="$2"
  __shellpen__pens_new_aliasName="$4"
else
  shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi

if shellpen pens exists "$__shellpen__pens_new_penName"
then
  shellpen -- errors argumentError '%s\n%s' "Pen '$__shellpen__pens_new_penName' already exists" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi

if [ -n "$__shellpen__pens_new_sourceName" ] && ! shellpen sources exists "$__shellpen__pens_new_sourceName"
then
  shellpen sources new "$__shellpen__pens_new_sourceName"
fi

[ -z "$__shellpen__pens_new_sourceName" ] && shellpen sources current __shellpen__pens_new_sourceName

if [ "$__shellpen__pens_new_createAlias" = true ]
then
  [ -z "$__shellpen__pens_new_aliasName" ] && __shellpen__pens_new_aliasName="$__shellpen__pens_new_penName"
  local __shellpen__pens_new_aliasFunctionCode="
$__shellpen__pens_new_aliasName() {
  # Get the source name for this pen
  local __shellpen__penAlias_sourceName=''
  shellpen pens getSource \"$__shellpen__pens_new_penName\" - __shellpen__penAlias_sourceName

  # Call an 'append' shellpen DSL function
  # Sets the SHELLPEN_SOURCE environment variable which 'append' functions respect
  # to the *current* source for this pen (allowing the source to be changed later)
  # Also provides the pen name for debugging.
  SHELLPEN_SOURCE=\"\$__shellpen__penAlias_sourceName\" SHELLPEN_PEN=\"$__shellpen__pens_new_penName\" shellpen append \"\$@\"
}
"
  # Try it in a subshell first
  local __shellpen__pens_new_aliasFunctionEvalOutput=''
  __shellpen__pens_new_aliasFunctionEvalOutput="$( eval "$__shellpen__pens_new_aliasFunctionCode" 2>&1 )"
  if [ $? -ne 0 ]
  then
    shellpen -- errors argumentError '%s\n%s\n%s' "Alias name '$__shellpen__pens_new_aliasName' is not valid, please choose something that works as as valid BASH function name. Pen creation failed." "Command: shellpen ${__shellpen__originalCliCommands[*]}" "Function creation error: '$__shellpen__pens_new_aliasFunctionEvalOutput'"
    return 2
  else
    eval "$__shellpen__pens_new_aliasFunctionCode"
  fi
fi

_SHELLPEN_PENS+=("$__shellpen__pens_new_penName")
_SHELLPEN_PEN_SOURCES+=("$__shellpen__pens_new_sourceName")
{% endhighlight %}
{% raw %}

</details>





> Create a new pen (optionally associated with a new or existing source)

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[name]` | Create a new pen for the current source with the provided name
`2` | `[name] [source]` | Create a new pen for the provided source (will be created if it does not already exist)
`2` | `[name] [-]` | Create a new pen for the current source _but do not create a writer alias function_
`3` | `[name] [-] [alias]` | Create a new pen for the current source _and create an alias function with the provided name_
`3` | `[name] [source] [-]` | Create a new pen for the provided source (will be created if it does not already exist) _but do not create a writer alias function_
`4` | `[name] [source] [-] [alias]` | Create a new pen for the provided source (will be created if it does not already exist) _and create an alias function with the provided name_


#### Aliases

Regardless of the alias you provide, `shellpen` will create a BASH function with the provided name.

It is up to you to provide a valid function name! If the function name is invalid, this will fail.

This also allows you to accidentally create pens with names which override built-in BASH functions
such as 'unset' or 'declare' which will essentially completely blow up the world 💥


                    
  
    

    
    

# [`shellpen pens list`](/api/shellpen/pens/list)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__pens_list_sourceName=''
[ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
for __shellpen__pens_list_sourceName in "${_SHELLPEN_PENS[@]}"
do
  if [ $# -eq 2 ] && [ "$1" = "-" ]
  then
    eval "$2+=(\"\$__shellpen__pens_list_sourceName\")"
  else
    echo "$__shellpen__pens_list_sourceName"
  fi
done
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen pens exists`](/api/shellpen/pens/exists)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
shellpen -- getPenIndex "$@" >/dev/null
{% endhighlight %}
{% raw %}

</details>







                    
  
    

    
    

# [`shellpen pens getSource`](/api/shellpen/pens/getSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

if [ $# -gt 0 ] && ! shellpen pens exists "$1"
then
  shellpen -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi

if [ $# -eq 1 ]
then
  local __shellpen__pens_getSource_penIndex=''
  shellpen -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
  printf '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  local __shellpen__pens_getSource_penIndex=''
  shellpen -- getPenIndex "$1" - __shellpen__pens_getSource_penIndex
  printf -v "$3" '%s' "${_SHELLPEN_PEN_SOURCES["$__shellpen__pens_getSource_penIndex"]}"
else
  shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi
{% endhighlight %}
{% raw %}

</details>





> Print or get the source associated with the given pen name

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[name]` | Print the source name associated with the provided pen name
`3` | `[name] [-] [varName]` | Get the source name associated with the provided pen name


                    
  
    

    
    

# [`shellpen pens switchSource`](/api/shellpen/pens/switchSource)



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

if [ $# -eq 1 ]
then
  # "default" should be '0' but it could be deleted (once we provide that functionality)
  local __shellpen__pens_switchSource_penIndex=''
  if ! shellpen -- getPenIndex "default" - __shellpen__pens_switchSource_penIndex
  then
    shellpen -- errors argumentError '%s\n%s' "Pen not found: 'default'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  else
    if shellpen sources exists "$1"
    then
      _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$1"
    else
      shellpen -- errors argumentError '%s\n%s' "Source '$1' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
      return 2
    fi
  fi
elif [ $# -eq 2 ]
then
  local __shellpen__pens_switchSource_penIndex=''
  if ! shellpen -- getPenIndex "$1" - __shellpen__pens_switchSource_penIndex
  then
    shellpen -- errors argumentError '%s\n%s' "Pen not found: '$1'" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
    return 1
  else
    if shellpen sources exists "$2"
    then
      _SHELLPEN_PEN_SOURCES["$__shellpen__pens_switchSource_penIndex"]="$2"
    else
      shellpen -- errors argumentError '%s\n%s' "Source '$2' does not exist" "Command: shellpen ${__shellpen__originalCliCommands[*]}"
      return 2
    fi
  fi
fi
{% endhighlight %}
{% raw %}

</details>





> Switch the current or provided pen to use a different, provided source

### Valid signatures:

|| Argument List | Description
-|-
`1` | `[source]` | Set the default pen's source to use the provided source
`2` | `[pen] [source]` | Set the provided pen to use the provided source


                    
      
{% endraw %}
