---
title: 'int • 🖋️ Command Reference'
permalink: /docs/int
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `int`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local globalArgument=''
[ "$1" = '-g' ] && { globalArgument='-g '; shift; }

if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
  then
    !fn --shellpen-private writeDSL writeln "declare ${globalArgument}-i ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
  else
    !fn --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1"
  fi
elif [ $# -eq 2 ]
then
  !fn --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1=$2"
elif [ $# -eq 3 ] && [ "$2" = '=' ]
then
  !fn --shellpen-private writeDSL writeln "declare ${globalArgument}-i $1=$3"
fi
{% endhighlight %}

</details>



> Define an integer variable







