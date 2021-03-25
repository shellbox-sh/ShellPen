---
title: "shellpen sources list"
---

{% raw %}





[🔙 Back to shellpen sources](/api/shellpen/sources)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen sources list



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
local __shellpen__sources_list_sourceName=''
[ $# -eq 2 ] && [ "$1" = "-" ] && eval "$2=()"
for __shellpen__sources_list_sourceName in "${_SHELLPEN_SOURCES[@]}"
do
  if [ $# -eq 2 ] && [ "$1" = "-" ]
  then
    eval "$2+=(\"\$__shellpen__sources_list_sourceName\")"
  else
    echo "$__shellpen__sources_list_sourceName"
  fi
done
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
