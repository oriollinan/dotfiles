require "nvchad.mappings"

local map = vim.keymap.set

-- vim tmux navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

-- epitech headers
local epitechHeaders = require "custom.epitech-headers"
map("n", "<leader>ce", epitechHeaders.insertHeader, { desc = "epitech headers" })

-- close buffer
vim.keymap.del("n", "<leader>x")
map("n", "<leader>q", ":bd<CR>", { desc = "close current buffer" })

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "<leader>lk", "<cmd>lnext<CR>zz")
map("n", "<leader>lj", "<cmd>lprev<CR>zz")
map("n", "<leader>ck", "<cmd>cnext<CR>zz")
map("n", "<leader>cj", "<cmd>cprev<CR>zz")

