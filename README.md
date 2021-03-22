[![Mac (BASH 3.2)](<https://github.com/shellbox-sh/ShellPen/workflows/Mac%20(BASH%203.2)/badge.svg>)](https://github.com/shellbox-sh/ShellPen/actions?query=workflow%3A%22Mac+%28BASH+3.2%29%22) [![BASH 4.3](https://github.com/shellbox-sh/ShellPen/workflows/BASH%204.3/badge.svg)](https://github.com/shellbox-sh/ShellPen/actions?query=workflow%3A%22BASH+4.3%22) [![BASH 4.4](https://github.com/shellbox-sh/ShellPen/workflows/BASH%204.4/badge.svg)](https://github.com/shellbox-sh/ShellPen/actions?query=workflow%3A%22BASH+4.4%22) [![BASH 5.0](https://github.com/shellbox-sh/ShellPen/workflows/BASH%205.0/badge.svg)](https://github.com/shellbox-sh/ShellPen/actions?query=workflow%3A%22BASH+5.0%22)

---
# 🖋️ Shell Pen

> 🖋️ Generate BASH source code, XML, HTML, CSV, and more!

Download the [latest version](https://github.com/shellbox-sh/shellpen/archive/v0.1.0.tar.gz) by clicking one of the download links above or:

```sh
curl -o- https://shellpen.sh/installer.sh | bash
```

- _This includes support for all languages, click links below for specific installers_

## ✒️ Supported Languages

`ShellPen` has built-in adapters available for authoring:

 - [XML (`.xml`)](/xml)
 - [HTML (`.html`)](/html)
 - [Plain-text (`.txt`)](/text)
 - [Markdown (`.md`)](/markdown)
 - [BASH source code (`.sh`)](/bash)
 - [Comma-delimited files (`.csv`)](/csv)
 - [INI configuration files (`.ini`)](/ini)

### 🖊️ `ShellPen` for developers

_See [Authoring a ShellPen adapter](/dev) to author your own `ShellPen` adapter!_

# 🖋️ Getting Started

[✍️ Installation](#-installation)

[📄 Documents](#-documents)
 - [Create Document](#create-document)
 - [Write to Document](#write-to-document)
 - [View Document](#view-document)

[🖊️ Pens](#️-pens)
 - [Create Pen](#create-pen)
 - [Write to Document using Pen](#write-to-document-using-pen)
 - [View Document](#view-document-1)
 - [How does this work?](#-how-does-this-work)

[🎓 Learn More](#-learn-more)

## ✍️ Installation

> _If you are interested in authoring one specific language only, follow the relevant link in [Supported Languages](#supported-languages) for instructions on installation_.

The examples on this page will use the `ShellPen` HTML writer.

To install _just_ the HTML writer, run the following command:

```sh
curl -o- https://shellpen.sh/html/installer.sh | bash
```

To verify your download, you can run the downloaded `ShellPen` file:

```sh
./ShellPen --version
# => ShellPen version 2.0.0
```

## 📄 Documents

`ShellPen` writes to _"documents"_ which represent text you wish to generate.

For example, a document might represent a chunk of HTML or Plain-text.

> _Note: documents are not files, they are simply a representation of a chunk of text to write to (which may optionally be saved to a file)_

### Create Document

- This example creates a new HTML document named `webpage`:

```sh
$ ShellPen documents create html example
```

### Write to Document

- This example adds a new HTML node named `<title>` to `webpage`:

```sh
$ ShellPen documents write webpage title "Hello, world!"
```

### View Document

- This example previews the current state of the `webpage` document:

```sh
$ ShellPen documents preview hello
```

```html
<title>Hello, world!</title>
```

> You may have noticed that these commands are a bit verbose!  
> `ShellPen` _"pens"_ provide a simpler interface for writing documents 🖊️

## 🖊️ Pens

`ShellPen` uses _"pens"_ to improve the experience of writing to documents.

Pens are shell aliases which are bound to writing to a certain document.

### Create Pen

- This example creates a new pen named `page` which writes to the `webpage` document:

```sh
$ ShellPen pens create page webpage
```

Now you can write HTML to the `webpage` document using the `page` alias:

### Write to Document using Pen

- This example adds new `<ul>` and `<li>` nodes to the `webpage` document:

```sh
$ page ul
$ page - li "Hello, list item!
```

Now preview the `webpage` document after writing using the `.e.g.` pen:

### View Document

```sh
$ ShellPen documents preview hello
```

```html
<title>Hello, world!</title>
<ul>
  <li>Hello, list item!</li>
</ul>
```

#### ❓ How does this work?

A `ShellPen` _"pen"_ is a shell function bound to write to a certain document.

This pen command:

```sh
$ pen - li "Hello, list item!"
```

Is identical to the running following command:

```sh
$ ShellPen documents write webpage - li "Hello, list item!"
```

# 🎓 Learn More

To learn how to use `ShellPen` for a certain language, click the link below:

 - [XML (`.xml`)](/xml)
 - [HTML (`.html`)](/html)
 - [Plain-text (`.txt`)](/text)
 - [Markdown (`.md`)](/markdown)
 - [BASH source code (`.sh`)](/bash)
 - [Comma-delimited files (`.csv`)](/csv)
 - [INI configuration files (`.ini`)](/ini)

To learn the generic `ShellPen` command-line API, view the [API Reference](/api).

To learn how to author your own `ShellPen` API, view the [Developer docs](/dev).

## 👩‍💻 BASH Developers

> Note for BASH developers:

If you are using BASH, you can `source` `ShellPen` as a library.

This provides the following benefits:

 - Performance (_`ShellPen` stores documents in variables rather than files_)
 - Expanded API (_`ShellPen` functions can set output variables in BASH_)

`ShellPen` detects whether it was run as a binary or BASH function.

> To force `ShellPen` into binary mode when using it as a function, set
> the `SHELLPEN_MODE=binary` global variable before calling `ShellPen`.

To learn more, view the [Developer docs](/dev).

---
