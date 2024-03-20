local M = {}

---@class HandSide
---@field left number
---@field right number
hand_side = {
  left = 1,
  right = 2,
}

---@class KeyboardLayout
local us_keyboard_layout = {
  a = hand_side.left,
  b = hand_side.left,
  c = hand_side.left,
  d = hand_side.left,
  e = hand_side.left,
  f = hand_side.left,
  g = hand_side.left,
  h = hand_side.right,
  i = hand_side.right,
  j = hand_side.right,
  k = hand_side.right,
  l = hand_side.right,
  m = hand_side.right,
  n = hand_side.right,
  o = hand_side.right,
  p = hand_side.right,
  q = hand_side.left,
  r = hand_side.left,
  s = hand_side.left,
  t = hand_side.right,
  u = hand_side.right,
  v = hand_side.left,
  w = hand_side.left,
  x = hand_side.left,
  y = hand_side.right,
  z = hand_side.left,
}

---@class KeyboardLayouts
---@field us KeyboardLayout
M.layouts = {
  us = us_keyboard_layout,
}

function is_letter(char)
  return char:match("%a") ~= nil
end

M.is_different_hand_side = function(layout, prev_char, current_char)
  if prev_char and current_char and is_letter(prev_char) and is_letter(current_char) then
    local prev_hand_side = M.layouts[layout][prev_char]
    local current_hand_side = M.layouts[layout][current_char]

    return prev_hand_side and current_hand_side and prev_hand_side ~= current_hand_side
  else
    return false
  end
end
return M
