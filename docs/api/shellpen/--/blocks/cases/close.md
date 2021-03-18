---
---

{% raw %}





[🔙 Back to shellpen -- blocks cases](/api/shellpen/--/blocks/cases)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- blocks cases close



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"close")
  if [ "${_SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]}" = true ];
  then
    shellpen esac
  fi
  _SHELLPEN_CASE_OPEN[$_SHELLPEN_CURRENT_SOURCE_INDEX]=false
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
