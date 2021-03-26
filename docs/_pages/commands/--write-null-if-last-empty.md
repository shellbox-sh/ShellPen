---
title: '🖋️ Extending Syntax'
permalink: /extensions/--write-null-if-last-empty
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

# `--write-null-if-last-empty`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
then
  if [ -z "$BASH_PRE_43" ]
  then
    if [ "${SHELLPEN_SOURCE_CONTEXT_EMPTY[$SHELLPEN_CONTEXT_RIGHT_INDEX]}" = true ]
    then
      !fn --shellpen-private writeDSL : 
    fi
  else
    eval "
      if [ \"\${__SHELLPEN_CONTEXT_EMPTY_$SHELLPEN_SOURCE_ID[$SHELLPEN_CONTEXT_RIGHT_INDEX]}\" = \"true\" ]
      then
        !fn --shellpen-private writeDSL ':'
      fi
    "
  fi
fi
{% endhighlight %}

</details>



> Append a `:` if the last item in the current stack is empty







