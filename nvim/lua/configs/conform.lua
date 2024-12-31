local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    python = { "black" },
    yaml = { "prettier" },
    haskell = { "ormolu" },
    json = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    black = {
      prepend_args = {
        "--fast",
      },
    },
  },
}

require("conform").setup(options)
