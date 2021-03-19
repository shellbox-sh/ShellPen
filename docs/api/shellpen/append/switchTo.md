---
title: "shellpen append switchTo"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append switchTo



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





#### Return Values

| | Description |
|-|-------------|
| `1` | If the provided source does not exist |





  
{% endraw %}
