---@class LuaSyntax
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
    pattern = "*.js",
  },
  javascriptreact = {
    keywords = require("syntax-hand-fix.keywords.javascript"),
    pattern = { "*.jsx", "*.js" },
  },
  typescript = {
    keywords = require("syntax-hand-fix.keywords.typescript"),
    pattern = "*.ts",
  },
  typescriptreact = {
    keywords = require("syntax-hand-fix.keywords.typescript"),
    pattern = { "*.tsx", "*.ts" },
  },
  csharp = {
    keywords = require("syntax-hand-fix.keywords.csharp"),
    pattern = "*.cs",
  },
}
