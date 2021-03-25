---
title: 'fromText'
permalink: /docs/fromText
layout: single
sidebar:
  nav: 'command_reference'
---

# `fromText`



<details>
  <summary>View Source</summary>

{% highlight sh %}

local string="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' <<< "string"newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ <<< \"$string\"$NEWLINE}"
{% endhighlight %}

</details>








