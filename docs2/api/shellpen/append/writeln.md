---
title: "shellpen append writeln"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append writeln



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










  
{% endraw %}
