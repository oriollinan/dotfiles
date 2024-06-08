require "nvchad.mappings"

local map = vim.keymap.set

-- vim tmux navigator
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "window up" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- epitech headers
local epitechHeaders = require("custom.epitech-headers")
vim.keymap.set("n","<leader>ce",epitechHeaders.insertHeader, {desc = "Epitech Headers"})

