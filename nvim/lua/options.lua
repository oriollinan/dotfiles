require "nvchad.options"

local o = vim.o

-- Tab indents 4
o.softtabstop = 4
o.shiftwidth = 4

-- Highlight trailing spaces
vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]

-- Set column 80
o.colorcolumn = "80"
vim.cmd [[highlight ColorColumn ctermbg=grey guibg=grey]]

-- Relative numbers
vim.wo.relativenumber = true

-- Show git ignored
-- require("nvim-tree").setup {
--   filters = {
--     git_ignored = false,
--   },
-- }
