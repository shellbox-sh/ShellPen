---
---

{% raw %}





[🔙 Back to shellpen](/api/shellpen)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen error



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"error")
  if [ $# -eq 1 ]
  then
    shellpen writeln echo \"$*\" '>&2'
    shellpen return 1
  else
    shellpen writeln printf $@ '>&2'
    shellpen return 1
  fi
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
