---
title: "shellpen pens list"
---

{% raw %}





[🔙 Back to shellpen pens](/api/shellpen/pens)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen pens list



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










  
{% endraw %}
