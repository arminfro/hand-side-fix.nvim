local module = require("hand-side-fix.module")
local mixups = require("hand-side-fix.mixups")
local languages = require("hand-side-fix.languages")
local validate_config = require("hand-side-fix.validate-config")

---@class CustomKeywords
---@field pattern string
---@field keywords string[]
local custom_keywords = {}

---@class Config
---@field layout string
---@field excludes string[]
---@field custom_keywords CustomKeywords[]
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

  local is_valid, error_msg = validate_config.validate(M.config)
  if not is_valid then
    error(error_msg)
  end

  if M.config.custom_keywords then
    for i, value in pairs(M.config.custom_keywords) do
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = value.pattern,
        desc = "hand-side-fix custom_keywords[" .. i .. "] init",
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
