return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  config = function()
    vim.keymap.set('n', '<leader>mt', '<CMD>Markview Toggle<CR>', { desc = '[M]arkview [T]oggle' })
    vim.keymap.set('n', '<leader>ms', '<CMD>Markview splitToggle<CR>', { desc = '[M]arkview [S]plit' })
  end,
}
