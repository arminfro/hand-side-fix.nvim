local M = {}

local utils = require("hand-side-fix.utils")

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
  if prev_char and current_char and utils.is_letter(prev_char) and utils.is_letter(current_char) then
    local prev_hand_side = M.layouts[layout][prev_char]
    local current_hand_side = M.layouts[layout][current_char]

    return prev_hand_side and current_hand_side and prev_hand_side ~= current_hand_side
  else
    return false
  end
end

return M
