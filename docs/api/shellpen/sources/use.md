---
---

{% raw %}





[🔙 Back to shellpen sources](/api/shellpen/sources)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen sources use



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








  
{% endraw %}
