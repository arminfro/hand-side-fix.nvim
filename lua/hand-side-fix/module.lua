---@class CustomModule
local M = {}

local mixups = require("hand-side-fix.mixups")
local abbreviations = require("hand-side-fix.abbreviations")

M.processed_buffers = {}

---@param opts Config
---@param language string
M.init = function(opts, language)
  local current_buffer = vim.api.nvim_get_current_buf()
  if not M.processed_buffers[current_buffer] then
    M.processed_buffers[current_buffer] = true

    local language_mixups = mixups.get(opts.layout, language, opts.excludes)
    abbreviations.init(language_mixups)
  end
end

return M