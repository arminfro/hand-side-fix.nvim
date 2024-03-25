# Abbreviations setup with `hand-side-fix.nvim`

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/arminfro/hand-side-fix.nvim/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

This plugin simplifies the setup of abbreviations tailored to specific keyboard
layouts and keywords of programming languages.
It addresses the common issue of typos that arise when consecutive letters are
pressed by different hands.

The plugin calculates keyword typos that occur from cross-handed typing and configures
Vim's native abbreviation system to correct them.

For example, in a language that supports the `const` keyword, typing `cosnt` will
correct the typo (in the case of a US keyboard).
See the [test data](https://github.com/arminfro/hand-side-fix.nvim/tree/main/tests/hand-side-fix/expectations) for all abbreviations.

You can also provide your own custom keywords to setup the correspondent abbreviations.

## Installation via `lazy.nvim`

Requires neovim-nightly:

`opts = true` would also be sufficient for US keyboard. Here is an example with some customization:

```lua
{
  "arminfro/hand-side-fix.nvim",
  event = "BufEnter",
  opts = {
    layout = "us",
    excludes = { "fi" },
    custom_keywords = {
      {
        pattern = "*.md",
        keywords = {
          "the", "of", "and", "to", "in", "is", "was", "that", "for", "as", "with", "by",
          "on", "are", "from", "be", "or", "his", "were", "it", "an", "at", "not", "which",
          "have", "he", "had", "this", "has", "also", "their", "but", "one", "can", "its",
          "on", "the", "other", "been", "more", "they", "used", "first", "all", "two",
        },
      },
    },
  },
},
```

## Supported Languages

- C/C++
- C#
- Go
- Haskell
- Html
- Java
- Javascript/Typescript
- Kotlin
- Lua
- Php
- Python
- Ruby
- Rust
- Scala
- Swift

## Contributing

- provide [some](https://github.com/arminfro/hand-side-fix.nvim/blob/main/lua/hand-side-fix/layouts/us.lua) keyboard layout file and I can wire it up
- provide [keywords](https://github.com/arminfro/hand-side-fix.nvim/tree/main/lua/hand-side-fix/keywords) list for a programming language not supported yet
- check the [keywords](https://github.com/arminfro/hand-side-fix.nvim/tree/main/lua/hand-side-fix/keywords) defined for a programming language and suggest improvements

If you would like to contribute to hand-side-fix, feel free to submit pull
requests or open issues.
