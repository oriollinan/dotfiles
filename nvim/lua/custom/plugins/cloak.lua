return {
  'laytan/cloak.nvim',
  config = function()
    require('cloak').setup {}
    vim.keymap.set('n', '<leader>ct', '<CMD>CloakToggle<CR>', { desc = '[C]loak [T]oggle' })
    vim.keymap.set('n', '<leader>cp', '<CMD>CloakPreviewLine<CR>', { desc = '[C]loak [P]review Line' })
  end,
}
