--- @return vim.lsp.Config
return {
  cmd = { 'haskell-language-server-wrapper', '--lsp' },
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
  root_dir = vim.fs.root(0, {
    'hie.yaml',
    'stack.yaml',
    'cabal.project',
    '*.cabal',
    'package.yaml',
    '.git',
  }),
  settings = {
    haskell = {
      formattingProvider = 'ormolu',
    },
  },
}
