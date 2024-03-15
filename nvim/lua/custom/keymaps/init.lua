-- Split windows with leader key
vim.keymap.set('n', '<leader>wh', ':split<CR>', { silent = true, desc = 'Split [W]indow [H]orizontally' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true, desc = 'Split [W]indow [V]ertically' })

-- Assuming your leader key is set to " " (space)
vim.keymap.set('n', '<leader>cc', function() vim.cmd('normal gcc') end,
	{ desc = "Toggle linewise comment on current line" })
vim.keymap.set('n', '<leader>cb', function() vim.cmd('normal gbc') end,
	{ desc = "Toggle blockwise comment on current line" })

-- For [count]gcc and [count]gbc, Neovim handles counts automatically,
-- so the same mappings work for toggling multiple lines based on the count provided before the command.

-- Operator-pending mode mappings for 'gc' and 'gb'
vim.keymap.set('o', '<leader>cc', 'gc', { desc = "Toggle linewise comment in operator-pending mode" })
vim.keymap.set('o', '<leader>cb', 'gb', { desc = "Toggle blockwise comment in operator-pending mode" })

-- Note: For the operator-pending mappings (`gc[count]{motion}` and `gb[count]{motion}`),
-- you typically don't need to provide a specific count or motion in the mapping itself.
-- The user will provide the count and motion when using the mapping.

-- Keymap to add a line in Normal mode
vim.keymap.set('n', '<Enter>', 'o<ESC>')
vim.keymap.set('n', '<S-Enter>', 'O<ESC>')

-- Keymap for codelens
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set('n', '<leader>cl', vim.lsp.codelens.run,
	{ desc = '[C]ode [L]enses', noremap = true, silent = true, buffer = bufnr })

-- Keymap for formatting files
vim.keymap.set('n', '<leader>cf', function()
	vim.lsp.buf.format()
end, { desc = '[C]ode [F]ormat', noremap = true, silent = true })

-- Keymap for code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- Epitech headers
local epitechHeaders = require("custom.keymaps.epitech-headers")
vim.keymap.set("n", "<leader>ce", epitechHeaders.insertHeader, {desc = "[C]ode [E]pitech Headers"})
