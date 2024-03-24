---@class MixupsModule
local M = {}

local keyboards = require("hand-side-fix.keyboards")
local languages = require("hand-side-fix.languages")
local utils = require("hand-side-fix.utils")

M.cache = {}

---@param layout string
---@param keyword string
---@return table<string, string>
local function keyword_mixup(layout, keyword)
  local mixups = {}
  local keyword_len = #keyword
  for i = 1, keyword_len - 1 do
    local char1 = keyword:sub(i, i)
    local char2 = keyword:sub(i + 1, i + 1)
    if keyboards.is_different_hand_side(layout, char1, char2) then
      local mixup = keyword:sub(1, i - 1) .. char2 .. char1 .. keyword:sub(i + 2)
      table.insert(mixups, mixup)
    end
  end
  return mixups
end

---@param layout string
---@param keywords string[]
---@param excludes string[]
---@return table<string, table<string, string>>
local function keywords_mixups(layout, keywords, excludes)
  local all_mixups = {}
  for _, keyword in ipairs(keywords) do
    local keyword_mixups = {}

    local mixups = keyword_mixup(layout, keyword)
    for _, mixup in ipairs(mixups) do
      -- if mixup is not a keyword and if it's not excluded
      if not utils.has_value(keywords, mixup) and not utils.has_value(excludes, mixup) then
        table.insert(keyword_mixups, mixup)
      end
    end

    if #keyword_mixups > 0 then
      all_mixups[keyword] = keyword_mixups
    end
  end
  return all_mixups
end

---@param layout string
---@param language string
---@param excludes string[]
---@return table<string, table<string, string>>
M.get = function(layout, language, excludes)
  if M.cache[layout] and M.cache[layout][language] then
    return M.cache[layout][language]
  else
    local mixups = keywords_mixups(layout, languages[language].keywords(), excludes)
    M.cache[layout] = M.cache[layout] or {}
    M.cache[layout][language] = mixups
    return mixups
  end
end

---@param layout string
---@param custom_keywords string[]
---@param excludes string[]
---@return table<string, table<string, string>>
M.get_custom = function(layout, custom_keywords, excludes, index)
  local id = "custom-" .. index
  if M.cache[layout] and M.cache[layout][id] then
    return M.cache[layout][id]
  else
    local mixups = keywords_mixups(layout, custom_keywords, excludes)
    M.cache[layout] = M.cache[layout] or {}
    M.cache[layout][id] = mixups
    return mixups
  end
end

return M
