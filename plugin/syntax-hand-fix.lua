-- vim.api.nvim_create_user_command("MyFirstFunction", require("syntax-hand-fix").hello, {})
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  callback = function()
    require("syntax-hand-fix").init("lua")
  end,
})
