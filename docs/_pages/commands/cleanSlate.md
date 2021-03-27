---
title: 'cleanSlate • 🖋️ Command Reference'
permalink: /docs/cleanSlate
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `cleanSlate`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

__SHELLPEN_SOURCES_TEXTS[$SHELLPEN_PEN_INDEX]=""

unset "__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID"
unset "__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID"

# Recreate supporting arrays for tracking the nested context
if [ -z "$BASH_PRE_43" ]
then
  declare -g -a "__SHELLPEN_CONTEXT_$sourceId=()"
  declare -g -a "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
else
  eval "__SHELLPEN_CONTEXT_$sourceId=()"
  eval "__SHELLPEN_CONTEXT_EMPTY_$sourceId=()"
fi
{% endhighlight %}

</details>



> Clean the slate of the current pen (_resets source code_)







