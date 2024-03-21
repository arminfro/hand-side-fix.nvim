---@class KeywordsModule
local M = {}

---@param tab table
---@param val string
M.has_value = function(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

---@param char string
M.is_letter = function(char)
  return char:match("%a") ~= nil
end

return M
