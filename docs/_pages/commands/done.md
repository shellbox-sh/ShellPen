---
title: 'done'
permalink: /docs/done
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private contexts writeNullIfEmpty
!fn --shellpen-private contexts pop
!fn --shellpen-private writeDSL writeln "done"
{% endhighlight %}

</details>



> End a `for` or `while` loop







