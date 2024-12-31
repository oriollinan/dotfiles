-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- local util = require "util/lspconfig"

local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "rust_analyzer",
  "ts_ls",
  "tailwindcss",
  "gopls",
  "sqls",
  "yamlls",
  "eslint",
  "gdscript",
  "groovyls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig["hls"].setup {
  filetypes = { "haskell", "lhaskell", "cabal" },
}
