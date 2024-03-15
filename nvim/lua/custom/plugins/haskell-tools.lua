return {
  'mrcjkb/haskell-tools.nvim',
  version = '^3', -- Recommended
  ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  config = function()
    require('lspconfig')['hls'].setup{
      filetypes = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
    }

    local ht = require('haskell-tools')
    local wk = require('which-key')
    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- haskell-language-server relies heavily on codeLenses,
    -- so auto-refresh (see advanced configuration) is enabled by default
    wk.register({
        h = {
          name = '[H]askell',
        },
      },
      {
        prefix = '<leader>'
      })
    -- Hoogle search for the type signature of the definition under the cursor
    vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature,
      vim.tbl_deep_extend("force", { desc = '[H]askell [S]earch' }, opts))
    -- Evaluate all code snippets
    vim.keymap.set('n', '<space>ea', ht.lsp.buf_eval_all,
      vim.tbl_deep_extend("force", { desc = '[E]valuate [A]ll code snipets' }, opts))
    -- Toggle a GHCi repl for the current package
    vim.keymap.set('n', '<leader>rr', ht.repl.toggle, vim.tbl_deep_extend("force", { desc = '[R]epl package' }, opts))
    -- Toggle a GHCi repl for the current buffer
    vim.keymap.set('n', '<leader>rf', function()
      ht.repl.toggle(vim.api.nvim_buf_get_name(0))
    end, vim.tbl_deep_extend("force", { desc = '[R]epl [B]uffer' }, opts))
    vim.keymap.set('n', '<leader>rq', ht.repl.quit, vim.tbl_deep_extend("force", { desc = '[R]epl [Q]uit' }, opts))
  end
}

