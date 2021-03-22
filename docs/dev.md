---
---

# 👩‍💻 Developer Docs

`ShellPen` is a basically a collection of mutable `String`s which provides:

 - space or tab indentation tracking and writing
 - a built-in stack for tracking nested object state, e.g. for XML trees
 - persisting BASH object state for in-progress documents

## APIs

The `ShellPen` binary (_and function_) provides three command-line APIs:

 - [`ShellPen [sources|pens|*]`](/api/shellpen) - the public API for end-users
 - [`ShellPen adapter [*]`](/api/adapters) - the public extensions API for adapters
 - [`ShellPen -- [*]`](/api/private) - the private API only be used by `ShellPen`

This documentation focuses on `ShellPen x` for authoring adapters.

## Documentation

The `ShellPen` developer documentation comes in two formats:

 - 🎓 [Authoring a ShellPen Adapter](/tutorial) tutorial for those who learn by doing
 - 🧐 [ShellPen Adapter Guide](/adapters) for those who prefer a reference guide

[`ShellPen adapter` API Reference](/api/adapters) has functions signatures (_with examples_)

### Publising your adapter

If you would like to publish your adapter alongside the official adapters:

 - [File an issue](https://github.com/shellbox-sh/ShellPen/issues/new) at [github.com/shellbox-sh/ShellPen](https://github.com/shellbox-sh/ShellPen) letting me know!
 - Send a Pull Request containing:
   - Installation script at `docs/[your-adapter-name]/installer.sh`
   - Your new adapter added to `adapters/[your-adapter-name]/`  
     (_must include tests, see existing languages for examples_)
   - A new documentation guide consistent with the others in `docs/`  
     (_must include docs, see existing languages for examples_)
   - Update the existing `docs/installer.sh` to include your adapter
   - Update `scripts/compile-shellpen` to include your adapter  
     (_see setup of existing languages in script_)

### Contributing

Contributions are very welcome!

Feel free to reach out via a GitHub issue or send a Pull Request!

#### 🐙 [https://github.com/shellbox-sh/ShellPen](https://github.com/shellbox-sh/ShellPen)

~ [`@beccasaurus`](https://github.com/beccasaurus)