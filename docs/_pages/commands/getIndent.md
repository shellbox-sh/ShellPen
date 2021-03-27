---
title: 'getIndent • 🖋️ Command Reference'
permalink: /docs/getIndent
layout: 'singleWithoutTitle'
sidebar:
  nav: 'command_reference'
---

# 🖋️ Command Reference

---

# `getIndent`

---



<details>
  <summary>View Source</summary>

{% highlight sh %}

local functionName="$1"

# Write the function
!fn --shellpen-private writeDSL writeln "$functionName() {"

# Push the DSL command to run to CLOSE this block
!fn --shellpen-private writeDSL --push "}"
{% endhighlight %}

</details>



> Begin a `function` definition block







