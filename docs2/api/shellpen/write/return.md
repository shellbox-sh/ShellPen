---
---

{% raw %}





[🔙 Back to shellpen write](/api/shellpen/write)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen write return



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
"return")
  if [ $# -eq 1 ]
  then
    shellpen writeln "return $1"
  else
    shellpen writeln "return 1"
  fi
{% endhighlight %}
{% raw %}

</details>








  
{% endraw %}
