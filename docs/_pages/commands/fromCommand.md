---
title: 'fromCommand'
permalink: /docs/fromCommand
layout: single
sidebar:
  nav: 'command_reference'
---

# `fromCommand`



<details>
  <summary>View Source</summary>

{% highlight sh %}

local commandString="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' < <(command here)newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < <\($commandString\)$NEWLINE}"
{% endhighlight %}

</details>








