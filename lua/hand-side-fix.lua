local module = require("hand-side-fix.module")

---@class Config
---@field layout string
---@field exclude string[]
local config = {
  layout = "us",
  excludes = {},
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
  if not pcall(require, "hand-side-fix.layouts." .. M.config.layout) then
    error("Layout " .. M.config.layout .. " not supported")
  end
end

---@param language string
M.init = function(language)
  return module.init(M.config, language)
end

return M
