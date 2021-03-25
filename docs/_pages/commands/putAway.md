---
title: 'putAway'
permalink: /docs/putAway
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

unset "__SHELLPEN_PENS[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_SOURCES[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]"
unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"
{% endhighlight %}

</details>



> Delete the current pen (_also deletes source code_)






