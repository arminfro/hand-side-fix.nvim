---@class Languages
---@field keywords string[]
---@field pattern string
return {
  lua = {
    keywords = require("hand-side-fix.keywords.lua"),
    pattern = "*.lua",
  },
  rust = {
    keywords = require("hand-side-fix.keywords.rust"),
    pattern = "*.rs",
  },
  javascript = {
    keywords = require("hand-side-fix.keywords.javascript"),
    pattern = { "*.jsx", "*.js" },
  },
  typescript = {
    keywords = require("hand-side-fix.keywords.typescript"),
    pattern = { "*.tsx", "*.ts" },
  },
  csharp = {
    keywords = require("hand-side-fix.keywords.csharp"),
    pattern = "*.cs",
  },
  c = {
    keywords = require("hand-side-fix.keywords.c"),
    pattern = "*.c",
  },
  cpp = {
    keywords = require("hand-side-fix.keywords.cpp"),
    pattern = "*.cpp",
  },
  go = {
    keywords = require("hand-side-fix.keywords.go"),
    pattern = "*.go",
  },
  haskell = {
    keywords = require("hand-side-fix.keywords.haskell"),
    pattern = "*.hs",
  },
  html = {
    keywords = require("hand-side-fix.keywords.html"),
    pattern = "*.html",
  },
  java = {
    keywords = require("hand-side-fix.keywords.java"),
    pattern = "*.java",
  },
  kotlin = {
    keywords = require("hand-side-fix.keywords.kotlin"),
    pattern = { "*.kt", "*.kts" },
  },
  php = {
    keywords = require("hand-side-fix.keywords.php"),
    pattern = "*.php",
  },
  python = {
    keywords = require("hand-side-fix.keywords.python"),
    pattern = "*.py",
  },
  ruby = {
    keywords = require("hand-side-fix.keywords.ruby"),
    pattern = "*.rb",
  },
  scala = {
    keywords = require("hand-side-fix.keywords.scala"),
    pattern = "*.scala",
  },
  swift = {
    keywords = require("hand-side-fix.keywords.swift"),
    pattern = "*.swift",
  },
}
