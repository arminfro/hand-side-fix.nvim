---@class KeywordsModule
local M = {}

---@param language_mixups table<string, table<string, string>>
M.init = function(language_mixups)
  for correctWord, wrongWords in pairs(language_mixups) do
    for _, wrongWord in ipairs(wrongWords) do
      vim.api.nvim_buf_set_keymap(0, "ia", wrongWord, correctWord, { silent = true })
    end
  end
end

return M
