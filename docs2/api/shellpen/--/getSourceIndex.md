---
title: "shellpen -- getSourceIndex"
---

{% raw %}





[🔙 Back to shellpen --](/api/shellpen/--)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- getSourceIndex



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 0 ]
then
  printf '%s' "$_SHELLPEN_CURRENT_SOURCE_INDEX"
elif [ $# -eq 1 ]
then
  local __shellpen__sources_exists_sourceIndex=''
  for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
  do
    if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
    then
      printf '%s' "$__shellpen__sources_exists_sourceIndex" 
      return 0
    fi
  done
  return 1
elif [ $# -eq 2 ] && [ "$1" = '-' ]
then
  printf -v "$2" '%s' "$_SHELLPEN_CURRENT_SOURCE_INDEX" 
elif [ $# -eq 3 ] && [ "$2" = '-' ]
then
  local __shellpen__sources_exists_sourceIndex=''
  for __shellpen__sources_exists_sourceIndex in "${!_SHELLPEN_SOURCES[@]}"
  do
    if [ "$1" = "${_SHELLPEN_SOURCES[$__shellpen__sources_exists_sourceIndex]}" ]
    then
      printf -v "$3" '%s' "$__shellpen__sources_exists_sourceIndex" 
      return 0
    fi
  done
  return 1
else
  shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: shellpen ${__shellpen__originalCliCommands[*]}"
  return 1
fi
{% endhighlight %}
{% raw %}

</details>



> Get the internal `shellpen` index of the current or provided source

### Valid signatures:

|| Argument List | Description
-|-
`0` || Print the index of the current source
`1` | `[source]` | Print the index of the provided source
`2` | `[-] [varName]` | Get the index of the current source
`3` | `[source] [-] [varName]` | Get the index of the provided source





#### Return Values

| | Description |
|-|-------------|
| `1` | If no source with the given name exists (fails silently) |





  
{% endraw %}
