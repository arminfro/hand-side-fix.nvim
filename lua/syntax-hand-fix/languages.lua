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
}
