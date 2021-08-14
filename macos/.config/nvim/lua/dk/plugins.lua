local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' 
  use 'altercation/vim-colors-solarized'
  use 'neovim/nvim-lspconfig'
end)
