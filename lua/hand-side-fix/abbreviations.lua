---@class KeywordsModule
local M = {}

---@param language_mixups table<string, table<string, string>>
M.init = function(language_mixups)
  for correct_word, wrong_words in pairs(language_mixups) do
    for _, wrong_word in ipairs(wrong_words) do
      vim.api.nvim_buf_set_keymap(0, "ia", wrong_word, correct_word, { silent = true })
    end
  end
end

return M
