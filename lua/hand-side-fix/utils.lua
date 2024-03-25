---@class Utils
local M = {}

---@param tab string[]
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

---@param tab CustomKeywords[]
---@param callback fun(value:CustomKeywords,index:number,tab:string[]): boolean
M.every = function(tab, callback)
  for i, v in ipairs(tab) do
    if not callback(v, i, tab) then
      return false
    end
  end
  return true
end

---@param value any
---@param type_arg string
---@return boolean
M.is_type = function(value, type_arg)
  return type(value) == type_arg
end

---@param tbl any[]
---@return any[]
M.filter = function(tbl)
  local filteredTable = {}

  for _, value in pairs(tbl) do
    if value ~= nil then
      table.insert(filteredTable, value)
    end
  end

  return filteredTable
end

return M
