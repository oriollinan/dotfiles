local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

map('i', '<C-C>', '<ESC>', { desc = 'Exit insert mode' })
map('n', '<C-C>', '<ESC>', { desc = 'Cancel command' })

map('n', '<Leader>bd', '<cmd>bdelete<CR>', { desc = '[B]uffer [D]elete' })
