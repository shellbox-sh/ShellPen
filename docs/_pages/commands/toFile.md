---
title: 'toFile'
permalink: /docs/toFile
layout: single
sidebar:
  nav: 'command_reference'
---

# `toFile`



<details>
  <summary>View Source</summary>

{% highlight sh %}

# Because '%s' and similar formatters are so common, look for a '%' formatter (but only one, and not after the --)

local filePath="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' > "file path"newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ > \"$filePath\"$NEWLINE}"
{% endhighlight %}

</details>








