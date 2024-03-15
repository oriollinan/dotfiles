return {

    -- Plugin for clangd extensions
    {
        'p00f/clangd_extensions.nvim',
        -- Lazy loading on specific file types can be an option
        ft = { 'c', 'cpp', 'h', 'hpp', 'objc', 'objcpp' },
        config = function()
            local opts = { noremap = true, silent = true }
            local wk = require("which-key")

            wk.register({
                c = {
                    C = {
                        name = "[C]lang",
                        s = vim.tbl_deep_extend("force", {
                            ":ClangdSwitchSourceHeader<CR>", "[S]witch Source Header"
                        }, opts),
                        i = vim.tbl_deep_extend("force", {
                            ":ClangdSymbolInfo<CR>", "Symbol [I]nfo" }, opts),
                        t = vim.tbl_deep_extend("force", {
                                ":ClangdAST<CR>", "Abstract Syntax [T]ree" },
                            opts)
                    }
                }
            }, {
                prefix = "<leader>"
            })

            -- clangd_extensions inlay hints setup
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()

            require("lspconfig").clangd.setup({
                cmd = {
                    "clangd",
                    "--fallback-style=webkit"
                }
            })
        end,
    },
}
