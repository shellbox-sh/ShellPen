---
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen result



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"result")
  shellpen -- blocks closeAll
  shellpen -- writeMain
  shellpen -- writeShebang
  
  if [ "$1" = "-n" ]
  then
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" | cat -n
  else
    echo -e "${_SHELLPEN_SOURCECODE[$_SHELLPEN_CURRENT_SOURCE_INDEX]}"
  fi
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
