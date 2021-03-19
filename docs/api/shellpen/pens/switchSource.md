---
title: "shellpen pens switchSource"
---

{% raw %}





[🔙 Back to shellpen pens](/api/shellpen/pens)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen pens switchSource



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





#### Return Values

| | Description |
|-|-------------|
| `1` | If the provided pen name does not exist |
| `2` | If the provided source name does not exist |





  
{% endraw %}
