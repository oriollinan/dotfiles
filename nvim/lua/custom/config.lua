vim.o.colorcolumn = '80'

local wk = require 'which-key'

-- NOTE: Spelling
wk.add {
  { 'zg', desc = 'Spell: add word [G]ood', mode = 'n' },
  { 'zw', desc = 'Spell: add word [W]rong', mode = 'n' },
  { ']s', desc = 'Spell: next misspelling', mode = 'n' },
  { '[s', desc = 'Spell: prev misspelling', mode = 'n' },
  { 'z=', desc = 'Spell: suggestions', mode = 'n' },
  { 'zG', desc = 'Spell: add word [G]lobally', mode = 'n' },
  { 'zuw', desc = 'Spell: [U]ndo add [W]ord', mode = 'n' },
}
