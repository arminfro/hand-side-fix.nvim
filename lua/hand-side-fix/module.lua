---@class CustomModule
local M = {}

local abbreviations = require("hand-side-fix.abbreviations")

M.processed_buffers = {}

---@param mixups fun(): table<string, table<string, string>>
M.init = function(mixups)
  local current_buffer = vim.api.nvim_get_current_buf()
  if not M.processed_buffers[current_buffer] then
    M.processed_buffers[current_buffer] = true

    abbreviations.init(mixups())
  end
end

return M
