---
title: '🖋️ Extending Syntax'
permalink: /extensions
layout: single
sidebar:
  nav: 'extensions_reference'
---

---

ShellPen supports extending the built-in pen syntax.

# Create an extension

To create an extension:

 - Create a BASH function (_this will be responsible for your custom syntax_)
 - Register the function with ShellPen via [`shellpen extend`](/extensions/extend)

##### Create Extension Function

```sh
# - hello
# This will add a "hello from the extension" comment to the code
helloExtension() {
  case "$1" in
    hello)
      # Use $PEN to call ShellPen commands from within your extension
      $PEN comment "hello from the extension"
      ;;
    *)
      # If your function does _not_ handle the incoming syntax
      # then you should 'return 1' to let ShellPen know that
      # your extension is not handling this command.
      return 1
      ;;
  esac
}
```

##### Register Extension Function

```sh
shellpen extend helloExtension
```

##### Try out your new extension!

```sh
- hello
```

```sh
# hello from the extension
```

# Indentation with blocks

Indentation is automatically added when using `if`, `while`, `for`, `case`, et al.

Each block has a respective command to close the block, e.g. `fi`, `done`, `esac`.

You can implement your own blocks with open and close commands and indentation is
automatically applied to commands added in your block.

##### Create an extension with open / close block syntax

```sh
# - myBlockOpen
# - myBlockClose
openCloseExtension() {
  case "$1" in
    myBlockOpen)
      $PEN comment "The block was opened"

      # To open a block, specify the command which
      # is used to _close_ the block by pushing
      # it onto the ShellPen indentation stack:
      $PEN --push "myClose"
      ;;
    myBlockClose)
      # To properly close the block, --pop
      # is used to note this block has been closed:
      $PEN --pop

      $PEN comment "The block was closed"
      ;;
    *)
      return 1
      ;;
  esac
}
```

##### Use the new block syntax

```sh
- echo "Example Program"
- myBlockOpen
  - echo "Hello from inside the block"
  - myBlockOpen
    - echo "Inner block!"
  - myBlockClose
- myBlockClose
- echo "Done!"
```

```sh
echo "Example Program"
# The block was opened"
  echo "Hello from inside the block"
  # The block was opened"
    echo "Inner block!"
  # The block was closed
# The block was closed
echo "Done!"
```
