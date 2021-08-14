local use = require('packer').use

require('packer').startup(function()
  use 'wbthomason/packer.nvim' 
  use 'ishan9299/nvim-solarized-lua'
  use 'neovim/nvim-lspconfig'
end)
