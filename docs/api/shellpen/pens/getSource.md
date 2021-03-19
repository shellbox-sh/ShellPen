---
title: "shellpen pens getSource"
---

{% raw %}





[🔙 Back to shellpen pens](/api/shellpen/pens)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen pens getSource



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





#### Return Values

| | Description |
|-|-------------|
| `1` | If no pen with the given name exists |





  
{% endraw %}
