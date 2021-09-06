-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('dk.plugins')

vim.cmd('syntax off') -- vim.o.syntax not working for now

-- vim.cmd('filetype plugin indent on')

vim.o.clipboard = 'unnamedplus' 

vim.o.hidden = true
vim.o.ignorecase =true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.lazyredraw = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'number'

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.background = 'light'
vim.cmd('colorscheme solarized')

-- open terminal in insert mode
vim.cmd('autocmd TermOpen * startinsert')

-- don't auto commenting new lines
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]])

-- use tabs for Go files
vim.cmd([[autocmd FileType go setlocal noexpandtab shiftwidth=8 tabstop=8]])

require('dk.keymaps')

require('dk.lsp')
