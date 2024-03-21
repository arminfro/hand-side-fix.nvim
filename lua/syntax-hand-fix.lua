local module = require("syntax-hand-fix.module")

---@class Config
---@field layout string
local config = {
  layout = "us",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

---@param language string
M.init = function(language)
  return module.init(M.config, language)
end

return M
