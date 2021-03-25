---
title: 'else'
permalink: /docs/else
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private contexts writeNullIfEmpty
!fn --shellpen-private contexts pop
!fn --shellpen-private writeDSL writeln "else"
!fn --shellpen-private contexts push "fi"
{% endhighlight %}

</details>









