-- main module file
local module = require("syntax-hand-fix.module")

---@class Config
---@field layout string --KeyboardLayout
local config = {
  layout = "us",
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
-- you can define your setup function here. Usually configurations can be merged, accepting outside params and
-- you can also put some validation here for those.
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

M.init = function(language)
  return module.init(M.config, language)
end

M.unload = function(language)
  return module.unload(M.config, language)
end

return M
