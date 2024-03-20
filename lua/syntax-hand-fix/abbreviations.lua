---@class KeywordsModule
local M = {}

M.init = function(language_mixups)
  for correctWord, wrongWords in pairs(language_mixups) do
    for _, wrongWord in ipairs(wrongWords) do
      vim.api.nvim_buf_set_keymap(0, "ia", wrongWord, correctWord, { silent = true })
    end
  end
end

M.unload = function(language_mixups)
  for _, wrongWords in pairs(language_mixups) do
    for _, wrongWord in ipairs(wrongWords) do
      vim.api.nvim_buf_del_keymap(0, "ia", wrongWord)
    end
  end
end

return M
