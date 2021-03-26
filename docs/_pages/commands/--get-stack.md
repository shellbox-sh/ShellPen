---
title: '🖋️ Extending Syntax'
permalink: /extensions/--get-stack
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

# `--get-stack`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

[ $# -eq 0 ] && { echo "!command [Extension Error]: requires name of an array variable to populate with the stack items" >&2; return 1; }

if [ -z "$BASH_PRE_43" ]
then
  local array
  typeset -n array="$1"
  local stackItem=''
  for stackItem in "${SHELLPEN_SOURCE_CONTEXT[@]}"
  do
    array+=("$stackItem")
  done
else
  eval "
    local stackItem=''
    for stackItem in \"\${__SHELLPEN_CONTEXT_$SHELLPEN_SOURCE_ID[@]}\"
    do
      $1+=(\"\$stackItem\")
    done
  "
fi
{% endhighlight %}

</details>



> Populate a provided array with the full current stack







