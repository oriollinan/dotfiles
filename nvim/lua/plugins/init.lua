return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "clangd",
        "pyright",
        "rust-analyzer"
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "python",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        -- low level
        "c",
        "cpp",
        "rust",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<Cmd>TmuxNavigateLeft<CR>" },
      { "<C-j>", "<Cmd>TmuxNavigateDown<CR>" },
      { "<C-k>", "<Cmd>TmuxNavigateUp<CR>" },
      { "<C-l>", "<Cmd>TmuxNavigateRight<CR>" },
    },
    lazy = false
  }
}
