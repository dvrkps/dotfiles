local set = function(mode, lhs, rhs, opts)
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

vim.cmd([[autocmd FileType go nmap <leader>r :terminal go run .<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>t :terminal go test -race -cover<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>y :terminal golangci-lint run<cr>]])
