---
title: '🖋️ Command Reference'
permalink: /docs/echo
layout: single
sidebar:
  nav: 'command_reference'
---

---

# `echo`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ $# -eq 0 ]
then
  !fn --shellpen-private writeDSL writeln "echo"
else
  !fn --shellpen-private writeDSL writeln "echo \"$*\""
fi
{% endhighlight %}

</details>



> `echo` the provided arguments (_wrapped in `"..."`_)







