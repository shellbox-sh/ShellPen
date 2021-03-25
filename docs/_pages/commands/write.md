---
title: 'write'
permalink: /docs/write
layout: single
sidebar:
  nav: 'command_reference'
---

# `write`



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private getCurrentIndent)$*"
!fn --shellpen-private contexts markLastNotEmpty
{% endhighlight %}

</details>








