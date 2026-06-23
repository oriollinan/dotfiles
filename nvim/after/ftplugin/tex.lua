vim.opt_local.spell = true
vim.opt_local.spelllang = { 'en_gb' }
vim.o.conceallevel = 2

vim.api.nvim_create_autocmd('User', {
  pattern = 'VimtexEventViewReverse',
  callback = function()
    vim.fn.execute '!open -a -g Ghostty'
  end,
})
