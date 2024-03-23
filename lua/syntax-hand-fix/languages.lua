---@class Languages
---@field keywords string[]
---@field pattern string
return {
  lua = {
    keywords = require("syntax-hand-fix.keywords.lua"),
    pattern = "*.lua",
  },
  rust = {
    keywords = require("syntax-hand-fix.keywords.rust"),
    pattern = "*.rs",
  },
  javascript = {
    keywords = require("syntax-hand-fix.keywords.javascript"),
    pattern = { "*.jsx", "*.js" },
  },
  typescript = {
    keywords = require("syntax-hand-fix.keywords.typescript"),
    pattern = { "*.tsx", "*.ts" },
  },
  csharp = {
    keywords = require("syntax-hand-fix.keywords.csharp"),
    pattern = "*.cs",
  },
  c = {
    keywords = require("syntax-hand-fix.keywords.c"),
    pattern = "*.c",
  },
  cpp = {
    keywords = require("syntax-hand-fix.keywords.cpp"),
    pattern = "*.cpp",
  },
  go = {
    keywords = require("syntax-hand-fix.keywords.go"),
    pattern = "*.go",
  },
  haskell = {
    keywords = require("syntax-hand-fix.keywords.haskell"),
    pattern = "*.hs",
  },
  html = {
    keywords = require("syntax-hand-fix.keywords.html"),
    pattern = "*.html",
  },
  java = {
    keywords = require("syntax-hand-fix.keywords.java"),
    pattern = "*.java",
  },
  kotlin = {
    keywords = require("syntax-hand-fix.keywords.kotlin"),
    pattern = { "*.kt", "*.kts" },
  },
  php = {
    keywords = require("syntax-hand-fix.keywords.php"),
    pattern = "*.php",
  },
  python = {
    keywords = require("syntax-hand-fix.keywords.python"),
    pattern = "*.py",
  },
  ruby = {
    keywords = require("syntax-hand-fix.keywords.ruby"),
    pattern = "*.rb",
  },
  scala = {
    keywords = require("syntax-hand-fix.keywords.scala"),
    pattern = "*.scala",
  },
  swift = {
    keywords = require("syntax-hand-fix.keywords.swift"),
    pattern = "*.swift",
  },
}
