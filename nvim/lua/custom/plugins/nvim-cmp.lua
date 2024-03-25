return {
    -- Autocompletion plugin itself
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- LuaSnip and cmp_luasnip for snippet support
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Optional build step for regex support in snippets, not supported on some Windows environments
                    if vim.fn.has 'win32' == 1 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
            },
            'saadparwaiz1/cmp_luasnip',

            -- LSP source for nvim-cmp
            'hrsh7th/cmp-nvim-lsp',
            -- Path source for nvim-cmp, for file system paths
            'hrsh7th/cmp-path',

            -- Friendly snippets
            'rafamadriz/friendly-snippets',
        },
        config = function()
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            require('luasnip.loaders.from_vscode').lazy_load()
            luasnip.config.setup {}

            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                completion = {
                    completeopt = 'menu,menuone,noinsert',
                },
                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete {},
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = cmp.config.sources({
                    { name = "copilot" },
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                }),
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        function(...)
                            if package.loaded["clangd_extensions"] then
                                return require('clangd_extensions.cmp_scores')(...)
                            end
                        end,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
            }
            -- Additional LSP configuration for clangd
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            require('lspconfig').clangd.setup {
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    -- Optional: Setup clangd_extensions here if you want to use its features
                    require("clangd_extensions.inlay_hints").setup_autocmd()
                end,
            }
        end
    }
}
