---
title: '--pop • 🖋️ Extending Syntax'
permalink: /extensions/--pop
layout: 'singleWithoutTitle'
sidebar:
  nav: 'extensions_reference'
---

# 🖋️ Extending Syntax

---

# `--pop`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
then

  if [ -z "$BASH_PRE_43" ]
  then
    unset "SHELLPEN_SOURCE_CONTEXT[$SHELLPEN_CONTEXT_RIGHT_INDEX]"
    unset "SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]"
  else
    eval "unset \"__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]\""
    eval "unset \"__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[\$SHELLPEN_CONTEXT_RIGHT_INDEX]\""
  fi

  (( SHELLPEN_CONTEXT_DEPTH-- ))
  (( SHELLPEN_CONTEXT_RIGHT_INDEX-- ))

fi
{% endhighlight %}

</details>



> Pop the last item off the current stack (_rightmost_)







