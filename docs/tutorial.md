---
---

# 🎓 Authoring a ShellPen Adapter

> Go back to [Developer docs](/docs)

This tutorial walks through the steps of creating an example adapter.

You will create a simple `<XML>` adapter. `<XML>` was chosen because:

 - It is well known
 - It contains nesting and indentation
 - It is commonly written to a file

Are you ready? Let's get started!

## Table of Contents

 - [⚙️ ShellPen Core](#-shellpen-core)
 - [✏️ Create Adapter](#-create-adapter)
 - [🔖 Register Adapter](#-register-adapter)
 - [💬 Call Adapter](#-call-adapter)
 - [🖋️ Respond to Pen Writing](#-respond-to-pen-writing)
 - [🔍 Respond to Document Preview](#-respond-to-document-preview)
 - [↩️ Handling Actions](#️-handling-actions)
 - [🛢️ Document Store](#-document-store)
 - [📝 Write to Document](#-write-to-document)
 - [🌲 Writing Nested XML Nodes](#-writing-nested-xml-nodes)
 - [▶️ Add Indentation](#-add-indentation)
 - [🎉 Wrap-up](#-document-variables)

## ⚙️ ShellPen Core

ShellPen already comes with an `<XML>` adapter so we will:

1. Name our adapter `brackets` (_because of XML's angle brackets_)
2. Use `ShellPen` `core` (_does not include the built-in XML adapter_)

Download and install the `core` version of `ShellPen`:

```sh
curl -o- https://shellpen.sh/core/installer.sh | bash
```

Verify your installation:

```sh
./ShellPen --version
# => "ShellPen version 2.0.0"
```

## ✏️ Create Adapter

To create a new `brackets` adapter, you must:

- Create an executable or function (_with any name_)
- Register the adapter with `ShellPen`  
  (_telling it how to call your executable or function_)

### `brackets.sh`

Create a new script file and name it `brackets.sh`:

```sh
#! /bin/bash

echo "'brackets' called with $# arguments: $*"
```

## 🔖 Register Adapter

Now register your script with `ShellPen` as a valid adapter:

```sh
$ ShellPen adapters register brackets "$PWD/brackets.sh"
```

You can verify that the `brackets` adapter is now registered via:

```sh
$ ShellPen adapters list
# => "brackets"
```

## 💬 Call Adapter

Now perform a `ShellPen` operation which your adapter should handle.

When `ShellPen documents create [adapterType] [name]` is called, this
command is delegated to the adapter so it may optionally perform
initialization of the document.

Call `ShellPen documents create brackets xmlDoc` and see what happens:

```sh
$ ShellPen documents create brackets xmlDoc
# => "'brackets' called with 1 arguments: xmlDoc"
```

The document was created (_because `brackets.sh` did not return non-zero_):

```sh
$ ShellPen documents list
# => xmlDoc [xml]
```

## 🖋️ Respond to Pen Writing

Users of `ShellPen` will generally write to your document via pens.

Create a pen named `XML` which will write to the `xmlDoc` document:

```sh
$ ShellPen pens create XML --writeTo xmlDoc
```

Try using it and see if `brackets.sh` is called with arguments:

```sh
$ XML hi
# => "'brackets' called with 3 arguments: write xmlDoc hi"
```

The `brackets` XML adapter was called by the pen:

 - `$1` The first argument given is the operation to perform (_e.g. `write`_)
 - `$2` The second argument given is the name of the document (_`xmlDoc`_)
 - `$*` The following arguments are whatever was passed to the pen

## 🔍 Respond to Document Preview

If you try to preview the document:

```sh
$ ShellPen documents preview xmlDoc
# => "'brackets' called with 2 arguments: preview xmlDoc"
```

You can see that `documents preview` _also_ simply delegates to the adapter.

The `brackets.sh` adapter needs to respond to both `write` and `preview`.

Let's update the code to do that now before moving forward.

## ↩️ Handling Actions

Update the `brackets.sh` script to handle separate actions:

```sh
#! /bin/bash

action="$1"
shift

document="$2"
shift

case "$action" in
  write)
    echo "This will write to the document"
   ;;
  preview)
    echo "This will be the document preview"
    ;;
  *)
    echo "Unsupported 'brackets' action: $action" >&2
    exit 1
    ;;
esac
```

Call the upated `brackets` adapter via `ShellPen` and the `XML` pen:

```sh
$ ShellPen documents preview xmlDoc
# => "This will be the document preview"

$ XML hello world
# => "This will write to the document"
```

Next let's handle these actions and actually write to the document.

But first, you'll learn about the `ShellPen` document store.

## 🛢️ Document Store

When `$ ShellPen documents create` is used, a new document is allocated.

These documents live in the `ShellPen` document store.

When `$ ShellPen` is invoked as an executable, the document store
is represented locally as a directory containing one file per document.

By default, this location is `$HOME/.shellpen/documents/`

- Note: when `ShellPen()` is invoked as a `source`'d function,
  the document store is represented locally simply as variables in memory.

The files in the document store are _not_ simply text files containing
the final output result of the document, e.g. the final `<XML>` text from `brackets`.

As an adapter, how you represent your documents is _entirely up to you_.

## 📝 Write to Document

Let's first write simple `<XML>` nodes _without_ thinking about nested nodes.

Update the `write)` case of `brackets.sh`:

### `write)`

```sh
write)
  nodeName="$1"; shift
  nodeText="$1"; shift

  ShellPen adapters write brackets "$document" OUTPUT \
    "<$nodeName>$nodeText</$nodeName>
  ;;
```

This appends the specified text to a new document string named `OUTPUT`.

```sh
$ XML hello world
```

Now update the `preview)` case of `brackets.sh` to print the `OUTPUT` string:

### `preview)`

```sh
preview)
  ShellPen adapters read brackets "$document" OUTPUT
  ;;
```

```sh
$ ShellPen documents preview xmlDoc
# => "<hello>world</hello>"
```

Done! But how do we _nest nodes_?

## 🌲 Writing Nested XML Nodes

Let's provide the following syntax for end-users to nest XML nodes:

```sh
$ XML hello          # create a <hello>
$ XML + world        # nest a <world> under <hello>
$ XML     foo "Foo"  # nest a <foo> with text under <world>
$ XML     bar "Bar"  # nest a <bar> with text under <world>
$ XML -              # Close the most recently open node
```

> Note: the spaces shown are not required, only added for visual aid

- When `hello` is provided, note that a `<hello>` node is open.
- When `+ world` is provided, note that a `<world>` is now open.
- Add `foo` and `bar` to the currently open node, which is `<world>`.
- When `-` is provided, close `<world>`.

So `-` means add a node to a stack and `+` means pop a node off the stack.

To do this, we can use the `ShellPen` document context stack.

Update the `write)` case of `brackets.sh`:

### `write)`

```sh
write)
  if [ "$1" = '+' ]; then # add a node to the stack

    # Push the node name onto the stack, e.g. 'hello'
    ShellPen adapters push brackets "$document" \
      NODES "$2"

    # Add the opening '<hello>' to out output string
    # (the closing </hello> will be added later)
    ShellPen adapters writeln brackets "$document" \
      OUTPUT "<$2>"

  elif [ "$1" = '-' ]; then # pop a node off the stack

    # Get the latest node name so that we can close it
    closeNodeName="$( ShellPen adapters pop brackets \
      "$document" NODES )"

    # Add the closing </hello> to the output string
    ShellPen adapters writeln brackets "$document" \
      OUTPUT "</$closeNodeName>"

  else
    # Add node normally
    ShellPen adapters writeln brackets "$document" \
      OUTPUT "<$1>$2</$1>"
  fi
  ;;
```

### Run the code

- Clear the `xmlDoc` to get a fresh start

```sh
$ ShellPen documents cleanSlate xmlDoc
```

- Add to the XML

```sh
$ XML hello          # create a <hello>
$ XML + world        # nest a <world> under <hello>
$ XML     foo "Foo"  # nest a <foo> with text under <world>
$ XML     bar "Bar"  # nest a <bar> with text under <world>
$ XML -              # Close the most recently open node
```

- Preview the output

```sh
$ ShellPen documents preview xmlDoc
# => "<hello>"
# => "<world>"
# => "<foo>Foo</foo>"
# => "<bar>Bar</bar>"
# => "</world>"
```

- Whoops! We forgot to close hello!

```sh
$ XML -
```

```sh
$ ShellPen documents preview xmlDoc
# => "<hello>"
# => "<world>"
# => "<foo>Foo</foo>"
# => "<bar>Bar</bar>"
# => "</world>"
# => "</hello>
```

## ▶️ Add Indentation

When using the `ShellPen` context stack, indentation is built-in.

In `brackets.sh`, simply change every `writeln` to `writeln:indented`:

```sh
write)
# ...
    # Add the closing </hello> to the output string
    ShellPen adapters writeln:indented brackets "$document" \
      OUTPUT "</$closeNodeName>"

  else
    # Add node normally
    ShellPen adapters writeln:indented brackets "$document" \
      OUTPUT "<$1>$2</$1>"
  fi
  ;;
```

Now try again!


```sh
$ ShellPen documents cleanSlate xmlDoc
```

- Add to the XML

```sh
$ XML hello
$ XML + world
$ XML     foo "Foo"
$ XML     bar "Bar"
$ XML   -
$ XML -
```

- Preview the output

```sh
$ ShellPen documents preview xmlDoc
# => "<hello>"
# => "  <world>"
# => "    <foo>Foo</foo>"
# => "    <bar>Bar</bar>"
# => "  </world>"
# => "</hello>"
```

> To configure the indent size for your adapter:  
  `export SHELLPEN_INDENT="\t"` (_or whatever you wish your indent to be_)

## 🎉 Wrap-up

That's it for this tutorial!

Hopefully this was enough to get you started.

Now, hop over to the 🧐 [ShellPen Adapter Guide](/adapters) to learn more!
