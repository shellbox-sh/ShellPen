---
title: '🖋️ Extending Syntax'
permalink: /extensions/--eval-full-stack
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

# `--eval-full-stack`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

while [ "$SHELLPEN_CONTEXT_RIGHT_INDEX" -ge 0 ]
do
  local depthBeforeEval="$SHELLPEN_CONTEXT_DEPTH"
  local lastCommand="$( !fn --shellpen-private writeDSL --get-last-pushed )"

  !fn --shellpen-private writeDSL --eval-last-pushed

  # Recalculate the context depth and right index from the context
  if [ -z "$BASH_PRE_43" ]
  then
    SHELLPEN_CONTEXT_DEPTH="${#SHELLPEN_SOURCE_CONTEXT[@]}"
  else
    eval "SHELLPEN_CONTEXT_DEPTH=\"\${#__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\""
  fi
  SHELLPEN_CONTEXT_RIGHT_INDEX="$(( SHELLPEN_CONTEXT_DEPTH - 1 ))"

  local depthAfterEval="$SHELLPEN_CONTEXT_DEPTH"

  [ $depthBeforeEval -eq $depthAfterEval ] && { echo "!fn [Extension Error] Expected '$lastCommand' to --pop stack" >&2; return 1; }
done
{% endhighlight %}

</details>



> Close every item on current stack (_from right to left_)







