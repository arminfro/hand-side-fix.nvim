---@class CustomModule
local M = {}

local mixups = require("syntax-hand-fix.mixups")

---@return string
---@param opts Config
M.init = function(opts, language)
  P(mixups.get(opts.layout, language))
end

M.unload = function() 
  print('DEBUGPRINT[1]: module.lua:12 (after M.unload = function())')
end

return M
