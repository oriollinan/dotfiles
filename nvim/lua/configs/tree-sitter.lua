local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.frostlang = {
  install_info = {
    url = "https://github.com/oriollinan/tree-sitter-frostlang.git",
    files = { "src/parser.c" },
    branch = "main",
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "ff",
}

vim.filetype.add {
  extension = {
    ff = "frostlang",
  },
}
