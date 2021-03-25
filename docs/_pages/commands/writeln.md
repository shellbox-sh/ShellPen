---
title: 'writeln'
permalink: /docs/writeln
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private getCurrentIndent)$*${NEWLINE}"
!fn --shellpen-private contexts markLastNotEmpty
{% endhighlight %}

</details>



> Append a line of text to source output including indentation







