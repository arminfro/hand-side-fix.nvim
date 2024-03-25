local module = require("hand-side-fix.module")
local mixups = require("hand-side-fix.mixups")
local languages = require("hand-side-fix.languages")

---@class Config
---@field layout string
---@field excludes string[]
---@field custom_keywords {pattern: string, keywords: string[]}[]
local config = {
  layout = "us",
  excludes = {},
}

---@class MyModule
local M = {}

---@type Config
M.config = config

---@param args Config?
M.setup = function(args)
  M.config = vim.tbl_deep_extend("force", M.config, args or {})

  if not pcall(require, "hand-side-fix.layouts." .. M.config.layout) then
    error("Layout " .. M.config.layout .. " not supported")
  end

  if M.config.custom_keywords then
    for i, value in pairs(M.config.custom_keywords) do
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = value.pattern,
        callback = function()
          module.init(function()
            return mixups.get(M.config.layout, value.keywords, M.config.excludes, "custom-key-cache" .. i)
          end)
        end,
      })
    end
  end
end

---@param language string
M.init = function(language)
  return module.init(function()
    return mixups.get(M.config.layout, languages[language].keywords(), M.config.excludes, language)
  end)
end

return M
