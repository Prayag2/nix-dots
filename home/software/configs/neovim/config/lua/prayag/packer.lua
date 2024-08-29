vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
  -- use 'wbthomason/packer.nvim'
  -- telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
