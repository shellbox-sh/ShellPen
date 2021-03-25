---
---

{% raw %}





[🔙 Back to shellpen write](/api/shellpen/write)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen write error



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
