local silentAndNoremap = { silent = true, noremap = true }

vim.api.nvim_set_keymap('i','jk','<esc>', silentAndNoremap)

vim.api.nvim_set_keymap('n','<enter>','O<esc>j', silentAndNoremap)

vim.api.nvim_set_keymap('n','<leader>w',':write<cr>', silentAndNoremap)
vim.api.nvim_set_keymap('n','<leader>q',':quit<cr>', silentAndNoremap)

vim.api.nvim_set_keymap('n','<leader>b','<c-^>', silentAndNoremap)
vim.api.nvim_set_keymap('n','<leader>bb',':buffers<cr>:b ', silentAndNoremap)

vim.api.nvim_set_keymap('n','<leader>vim',':edit $MYVIMRC<cr>', silentAndNoremap)

vim.api.nvim_set_keymap('n','<leader><leader>',':nohlsearch<cr>', silentAndNoremap)

vim.api.nvim_set_keymap('t','<esc>',[[<c-\><c-n>]], silentAndNoremap)
vim.api.nvim_set_keymap('t','jk',[[<c-\><c-n><esc>]], silentAndNoremap)

vim.cmd([[autocmd FileType go nmap <leader>r :terminal go run .<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>t :terminal go test -race -cover<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>y :terminal golangci-lint run<cr>]])
