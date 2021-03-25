---
title: 'echo'
permalink: /docs/echo
layout: single
sidebar:
  nav: 'command_reference'
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









