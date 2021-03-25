---
title: 'local'
permalink: /docs/local
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

if [ $# -eq 1 ]
then
  if [[ "$1" =~ ^([^=]+)=([^=]+)$ ]]
  then
    !fn --shellpen-private writeDSL writeln "local ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"
  else
    !fn --shellpen-private writeDSL writeln "local $1"
  fi
elif [ $# -eq 2 ]
then
  !fn --shellpen-private writeDSL writeln "local $1=$2"
elif [ $# -eq 3 ] && [ "$2" = '=' ]
then
  !fn --shellpen-private writeDSL writeln "local $1=$3"
fi
{% endhighlight %}

</details>









