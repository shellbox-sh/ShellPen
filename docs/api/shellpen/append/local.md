---
title: "shellpen append local"
---

{% raw %}





[🔙 Back to shellpen append](/api/shellpen/append)

---







<!-- Todo, if there are no subcommands under the child commands, use a smaller heading size -->

# shellpen append local



<details>
  <summary>View Source</summary>

{% endraw %}
{% highlight sh %}
if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^[^=]+=[^=]+$ ]]
  then
    shellpen append writeln "local ${1%%=*}=\"${1#*=}\""
  else
    shellpen append writeln "local $*"
  fi
elif [ $# -eq 2 ]
then
  shellpen append writeln "local $1=\"$2\""
fi
{% endhighlight %}
{% raw %}

</details>










  
{% endraw %}
