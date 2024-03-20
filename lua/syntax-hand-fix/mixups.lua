---@class CustomModule
local M = {}

local keyboards = require("syntax-hand-fix.keyboards")
local keywords_mod = require("syntax-hand-fix.keywords")
local utils = require("syntax-hand-fix.utils")

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

local function keywords_mixups(layout, keywords)
  local all_mixups = {}
  for _, keyword in ipairs(keywords) do
    local keyword_mixups = {}

    local mixups = keyword_mixup(layout, keyword)
    for _, mixup in ipairs(mixups) do
      if not utils.has_value(keywords, mixup) then
        table.insert(keyword_mixups, mixup)
      end
    end

    if #keyword_mixups > 0 then
      all_mixups[keyword] = keyword_mixups
    end
  end
  return all_mixups
end

M.get = function(layout, language)
  return keywords_mixups(layout, keywords_mod.languages[language])
end

return M
