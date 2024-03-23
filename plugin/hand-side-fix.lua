for language, value in pairs(require("hand-side-fix.languages")) do
  vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = value.pattern,
    callback = function()
      require("hand-side-fix").init(language)
    end,
  })
end
