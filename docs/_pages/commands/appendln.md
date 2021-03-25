---
title: 'appendln'
permalink: /docs/appendln
layout: single
sidebar:
  nav: 'command_reference'
---

# `appendln`



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*${NEWLINE}"
!fn --shellpen-private contexts markLastNotEmpty
{% endhighlight %}

</details>








