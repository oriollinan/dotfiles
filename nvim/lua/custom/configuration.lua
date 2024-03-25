-- Highlight trailing whitespace
vim.cmd [[highlight ExtraWhitespace ctermbg=red guibg=red]]
vim.cmd [[match ExtraWhitespace /\s\+$/]]

-- Set the color for column 80
vim.o.colorcolumn = "80"
vim.cmd [[highlight ColorColumn ctermbg=grey guibg=grey]]

-- Apply configurations for all file types using autocommands
vim.api.nvim_create_augroup("customs", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    group = "customs",
    pattern = "*",
    command = "highlight ExtraWhitespace ctermbg=red guibg=red",
})

vim.api.nvim_create_autocmd("BufEnter", {
    group = "customs",
    pattern = "*",
    command = "match ExtraWhitespace /\\s\\+$/",
})

-- Ensure the color column setting is applied consistently across buffers
vim.api.nvim_create_autocmd({"BufEnter", "WinEnter", "VimResized", "FileType"}, {
    group = "customs",
    pattern = "*",
    callback = function()
        vim.o.colorcolumn = "80"
    end,
})

