---
---

{% raw %}





[🔙 Back to shellpen sources](/api/shellpen/sources)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen sources getFilePath



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}

local __shellpen__sources_getFilePath_sourceIndex=''

if [ $# -eq 0 ]
then
  shellpen -- getSourceIndex - __shellpen__sources_getFilePath_sourceIndex
  local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
  [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
  printf '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
elif [ $# -eq 1 ]
then
  shellpen -- getSourceIndex "$1" - __shellpen__sources_getFilePath_sourceIndex || return 1
  local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
  [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
  printf '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
elif [ $# -eq 2 ]
then
  if [ "$1" = '-' ]
  then
    shellpen -- getSourceIndex - __shellpen__sources_getFilePath_sourceIndex
    local __shellpen__sources_getFilePath_sourceFilePath="${_SHELLPEN_SOURCES_FILE_PATHS["$__shellpen__sources_getFilePath_sourceIndex"]}"
    [ -z "$__shellpen__sources_getFilePath_sourceFilePath" ] && return 2
    printf -v "$2" '%s' "$__shellpen__sources_getFilePath_sourceFilePath"
  else
    shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
    return 1
  fi
else
  shellpen -- errors argumentError '%s\n%s' 'Invalid arguments' "Command: ${__shellpen__originalCliCommands[*]}"
  return 1
fi
{% endhighlight %}
{% raw %}

</details>



> Print or get the file path of the current or provided source

### Valid signatures:

|| Argument List | Description
-|-
`0` || Print the file path of the current source
`1` | `[name]` | Print the file path of the provided source
`2` | `[-] [varName]` | Get the file path of the current source
`3` | `[name] [-] [varName]` | Get the file path of the provided source





#### Return Values

| | Description |
|-|-------------|
| `1` | If source provided but source does not exist (fails silently) |
| `2` | If source does not have a file path configured (fails silently) |





  
{% endraw %}
