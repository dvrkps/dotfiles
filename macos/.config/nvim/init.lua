-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('dk.plugins')

vim.cmd('syntax off') -- vim.o.syntax not working for now

-- vim.cmd('filetype plugin indent on')

vim.o.clipboard = 'unnamedplus' 

vim.o.ignorecase =true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.lazyredraw = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.laststatus = 3

vim.o.number = true
vim.o.relativenumber = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'number'

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.background = 'light'
vim.cmd('colorscheme solarized')

local terminalGroup = vim.api.nvim_create_augroup("TerminalGroup", {clear= true})
-- open terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", { command="startinsert | setl nonu nornu signcolumn=no ", group=terminalGroup})

local generalGroup = vim.api.nvim_create_augroup("GeneralGroup", {clear= true})
-- don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {command="set fo-=c fo-=r fo-=o", group=generalGroup})

vim.cmd([[autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8]])
vim.cmd([[autocmd FileType go nmap <leader>r :terminal go run .<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>t :terminal go test -race -cover<cr>]])
vim.cmd([[autocmd FileType go nmap <leader>y :terminal golangci-lint run<cr>]])

require('dk.keymaps')

require('dk.lsp')
