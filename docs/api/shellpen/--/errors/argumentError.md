---
---

{% raw %}





[🔙 Back to shellpen -- errors](/api/shellpen/--/errors)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen -- errors argumentError



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"argumentError")
  if [ $# -gt 0 ]
  then
    printf '`shellpen` [Argument Error] ' >&2
    printf "$@" >&2
  else
    printf '`shellpen` [Argument Error]' >&2
  fi
  shellpen -- errors printStackTrace
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
