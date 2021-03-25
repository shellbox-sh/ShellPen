---
title: 'case'
permalink: /docs/case
layout: single
sidebar:
  nav: 'command_reference'
---



<details>
  <summary>View Source</summary>

{% highlight sh %}

!fn --shellpen-private writeDSL writeln "case \"$1\" in"
!fn --shellpen-private writeDSL --push "esac"
{% endhighlight %}

</details>



> Begin a `case` / `esac` statement






