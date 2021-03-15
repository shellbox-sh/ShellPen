---
---

{% raw %}

# 🖋️ Shell Pen

> 🖋️ Generate Shell Script Source Code using a familiar DSL!

Download the [latest version](https://github.com/shellbox-sh/shellpen/archive/v0.1.0.tar.gz) by clicking one of the download links above or:

```sh
curl -o- https://shellpen.sh/installer.sh | bash
```

## BASH Codegen

🖋️ Import the `shellpen` library:

```sh
source shellpen.sh         
```

🖋️ Use the DSL to define variables, functions, conditionals, etc!

```sh
shellpen :

: function sayHello
  : local command="\$1"
  : shift
  : case "\$command"
    : option hello
      : echo "Hello \$*!"
    : option goodbye
      : echo "Goodbye \$*!"

: main sayHello
```

🔍 Preview the current source code content

```sh
shellpen preview
```

```sh
#! /usr/bin/env bash

sayHello() {
  local command=$1
  shift
  case "$command" in
    hello)
      echo "Hello $*!"
      ;;
    goodbye)
      echo "Goodbye $*!"
      ;;
  esac
}

[ "${BASH_SOURCE[0]}" = "$0" ] && "sayHello" "$@"
```

💾 Save and run it!

```sh
shellpen save say-hello.sh
```

```sh
./say-hello.sh hello Rebecca
# => "Hello Rebecca!"
```

---


{% endraw %}
