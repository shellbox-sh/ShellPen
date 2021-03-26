---
title: '🖋️ Extending Syntax'
permalink: /extensions/--get-last-pushed
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

# `--get-last-pushed`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ -z "$BASH_PRE_43" ]
then
  printf '%s' "${SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]}"
else
  eval "printf '%s' \"\${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]}\""
fi
{% endhighlight %}

</details>



> Get last item pushed onto the current stack







