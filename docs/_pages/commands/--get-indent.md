---
title: '🖋️ Extending Syntax'
permalink: /extensions/--get-indent
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

# `--get-indent`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local INDENT=''

if [ -z "$BASH_PRE_43" ]
then
  declare -i SHELLPEN_CONTEXT_DEPTH="${#SHELLPEN_SOURCE_CONTEXT[@]}"
else
  eval "declare -i SHELLPEN_CONTEXT_DEPTH=\"\${#__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\""
fi

declare -i i=0
while [ $i -lt $SHELLPEN_CONTEXT_DEPTH ]
do
  INDENT+="$SHELLPEN_INDENT"
  (( i++ ))
done

printf '%s' "$INDENT"
{% endhighlight %}

</details>



> Get the text string to use to indent appended text







