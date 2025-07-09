local chars = 'LRTacfklopstv'
for i = 1, #chars do
  local c = chars:sub(i, i)
  vim.api.nvim_buf_del_keymap(0, 'i', '<C-c>' .. c)
end
