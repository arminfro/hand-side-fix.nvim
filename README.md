# Abbreviations setup with `hand-side-fix.nvim`

![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/arminfro/hand-side-fix.nvim/lint-test.yml?branch=main&style=for-the-badge)
![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)

This plugin is based on the idea that many typos occur because letters are typed with different hands.
It applies the idea to a small set of keywords.

The algorithm simply checks if two letters in sequence are pressed by different hands.
Based on this list, neovim's native abbreviation system will be configured to correct the typo.

Each language-specific abbreviation configuration will be applied once the defined file extension matches.

For example, in a language that supports the `const` keyword, typing `cosnt` will correct the typo (in the case of a US keyboard). See the [test data](https://github.com/arminfro/hand-side-fix.nvim/tree/main/tests/hand-side-fix/expectations) for all abbreviations.

You can also configure your own custom keywords based on file extension.

## Installation via `lazy.nvim`

Requires neovim-nightly.

```lua
{
  "arminfro/hand-side-fix.nvim",
  event = "BufEnter",
  opts = true,
},
```

## Configuration

- `excludes`, defines a global list which will be ignored in abbreviations
  - `"fi"` is just for demonstration, in case of `bash` it's not needed, keywords are ignored by default
- `custom_keywords`, is a list with file extension(s) and keywords to set specific abbreviation config

```lua
{
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
