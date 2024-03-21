for language, value in pairs(require("syntax-hand-fix.languages")) do
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = value.pattern,
    callback = function()
      require("syntax-hand-fix").init(language)
    end,
  })
end
