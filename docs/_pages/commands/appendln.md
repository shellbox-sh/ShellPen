---
title: 'appendln'
permalink: /docs/appendln
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
!fn --shellpen-private contexts markLastNotEmpty
{% endhighlight %}

</details>









