---
title: 'comment'
permalink: /docs/comment
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Do not use writeln because comments should not mark blocks as not empty
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]+="$(!fn --shellpen-private getCurrentIndent)# $*${NEWLINE}"
{% endhighlight %}

</details>



> Append a `#` command line







