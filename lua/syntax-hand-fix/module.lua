---@class CustomModule
local M = {}

local mixups = require("syntax-hand-fix.mixups")
local abbreviations = require("syntax-hand-fix.abbreviations")

---@param opts Config
M.init = function(opts, language)
  local language_mixups = mixups.get(opts.layout, language)
  abbreviations.init(language_mixups)
end

M.unload = function(opts, language)
  local language_mixups = mixups.get(opts.layout, language)
  abbreviations.unload(language_mixups)
end

return M
