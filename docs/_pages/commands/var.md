---
title: 'var • 🖋️ Command Reference'
permalink: /docs/var
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `var`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
  then
    !fn --shellpen-private writeDSL writeln "${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
  else
    !fn --shellpen-private writeDSL writeln "$1=''"
  fi
elif [ $# -eq 2 ]
then
  !fn --shellpen-private writeDSL writeln "$1=$2"
elif [ $# -eq 3 ] && [ "$2" = '=' ]
then
  !fn --shellpen-private writeDSL writeln "$1=$3"
fi
{% endhighlight %}

</details>



> Define a variable







