local function set(mode, lhs, rhs, opts)
  vim.keymap.set(mode,lhs,rhs,opts)
end

set('i','jk','<esc>')
set('n','<enter>','O<esc>j')

set('n','<leader>w',':write<cr>')
-- set('n','<leader>q',':quit!<cr>')

set('n','<leader>q',':quit!<cr>')

local telescope = require('telescope.builtin')

set('n','<leader>ff',telescope.find_files, {})
set('n','<leader>fg',telescope.live_grep, {})
set('n', '<leader>fb',telescope.buffers,{})

set('t','<esc>',[[<c-\><c-n>]])
set('t','jk',[[<c-\><c-n><esc>]])

