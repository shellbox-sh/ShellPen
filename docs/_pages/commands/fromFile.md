---
title: 'fromFile • 🖋️ Command Reference'
permalink: /docs/fromFile
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `fromFile`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local filePath="$1"
shift

local command="$1"
shift

!fn --shellpen-private writeDSL $command "$@"

# Chomp the newline and replace it with ' < "path"newline'
__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]="${__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]/%$NEWLINE/ < \"$filePath\"$NEWLINE}"
{% endhighlight %}

</details>



> Append `< "[file path]"` to the following command







