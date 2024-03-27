local M = {}

local utils = require("hand-side-fix.utils")

---@class HandSide
---@field left number
---@field right number
local hand_side = {}

---@class KeyboardLayouts
---@field us KeyboardLayout
---@field de KeyboardLayout
M.layouts = {
  us = require("hand-side-fix.layouts.us"),
  de = require("hand-side-fix.layouts.de"),
}

---@param layout string
---@param prev_char string
---@param current_char string
---@return boolean
M.is_different_hand_side = function(layout, prev_char, current_char)
  if prev_char and current_char then
    local prev_char_lowercase = string.lower(prev_char)
    local current_char_lowercase = string.lower(current_char)

    if utils.is_letter(prev_char_lowercase) and utils.is_letter(current_char_lowercase) then
      local prev_hand_side = M.layouts[layout][prev_char_lowercase]
      local current_hand_side = M.layouts[layout][current_char_lowercase]

      return prev_hand_side and current_hand_side and prev_hand_side ~= current_hand_side
    end
  end
  return false
end

return M
