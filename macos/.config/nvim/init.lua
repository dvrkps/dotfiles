-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('dk.plugins')

vim.cmd('syntax off')

-- vim.cmd('filetype plugin indent on')

vim.o.clipboard = 'unnamedplus' 

vim.o.ignorecase =true
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.lazyredraw = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.bo.expandtab = true  
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2
vim.bo.softtabstop = 2
  
vim.o.laststatus = 3

vim.o.number = true
vim.o.relativenumber = true

vim.o.updatetime = 250
vim.wo.signcolumn = 'number'

vim.o.termguicolors = true
vim.o.cursorline = true
vim.o.background = 'light'
vim.cmd('colorscheme solarized')

local initGroup = vim.api.nvim_create_augroup("InitGroup", {clear= true})
-- open terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", { command="startinsert | setl nonu nornu signcolumn=no ", group=initGroup})

-- don't auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {command="set fo-=c fo-=r fo-=o", group=initGroup})

vim.api.nvim_create_autocmd("FileType", {
  group = initGroup,
  pattern = "go",
  callback = function()
    vim.bo.tabstop = 8
    vim.bo.expandtab = false  
    vim.bo.shiftwidth = 8
    -- vim.schedule(function()
      -- print("eto me")
    -- end)
  end,
})


require('dk.keymaps')

require('dk.lsp')
