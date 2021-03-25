---
title: 'append'
permalink: /docs/append
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$*"
!fn --shellpen-private contexts markLastNotEmpty
{% endhighlight %}

</details>



> Append a string of text to source output _without indentation_







