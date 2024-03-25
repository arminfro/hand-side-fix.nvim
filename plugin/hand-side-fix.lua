for language, value in pairs(require("hand-side-fix.languages")) do
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = value.pattern,
    desc = "hand-side-fix init for language: " .. language,
    callback = function()
      require("hand-side-fix").init(language)
    end,
  })
end
