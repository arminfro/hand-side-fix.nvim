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
  if not pcall(require, "syntax-hand-fix.layouts." .. M.config.layout) then
    error("Layout " .. M.config.layout .. " not supported")
  end
end

---@param language string
M.init = function(language)
  return module.init(M.config, language)
end

return M
