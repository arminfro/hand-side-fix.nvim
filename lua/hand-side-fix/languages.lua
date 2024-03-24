---@class Languages
return {
  lua = {
    keywords = function()
      return require("hand-side-fix.keywords.lua")
    end,
    pattern = "*.lua",
  },
  rust = {
    keywords = function()
      return require("hand-side-fix.keywords.rust")
    end,
    pattern = "*.rs",
  },
  javascript = {
    keywords = function()
      return require("hand-side-fix.keywords.javascript")
    end,
    pattern = { "*.jsx", "*.js" },
  },
  typescript = {
    keywords = function()
      return require("hand-side-fix.keywords.typescript")
    end,
    pattern = { "*.tsx", "*.ts" },
  },
  csharp = {
    keywords = function()
      return require("hand-side-fix.keywords.csharp")
    end,
    pattern = "*.cs",
  },
  c = {
    keywords = function()
      return require("hand-side-fix.keywords.c")
    end,
    pattern = "*.c",
  },
  cpp = {
    keywords = function()
      return require("hand-side-fix.keywords.cpp")
    end,
    pattern = "*.cpp",
  },
  go = {
    keywords = function()
      return require("hand-side-fix.keywords.go")
    end,
    pattern = "*.go",
  },
  haskell = {
    keywords = function()
      return require("hand-side-fix.keywords.haskell")
    end,
    pattern = "*.hs",
  },
  html = {
    keywords = function()
      return require("hand-side-fix.keywords.html")
    end,
    pattern = "*.html",
  },
  java = {
    keywords = function()
      return require("hand-side-fix.keywords.java")
    end,
    pattern = "*.java",
  },
  kotlin = {
    keywords = function()
      return require("hand-side-fix.keywords.kotlin")
    end,
    pattern = { "*.kt", "*.kts" },
  },
  php = {
    keywords = function()
      return require("hand-side-fix.keywords.php")
    end,
    pattern = "*.php",
  },
  python = {
    keywords = function()
      return require("hand-side-fix.keywords.python")
    end,
    pattern = "*.py",
  },
  ruby = {
    keywords = function()
      return require("hand-side-fix.keywords.ruby")
    end,
    pattern = "*.rb",
  },
  scala = {
    keywords = function()
      return require("hand-side-fix.keywords.scala")
    end,
    pattern = "*.scala",
  },
  swift = {
    keywords = function()
      return require("hand-side-fix.keywords.swift")
    end,
    pattern = "*.swift",
  },
}
