local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- themes!
  use 'ellisonleao/gruvbox.nvim'
  use 'bluz71/vim-nightfly-colors'
  use 'shaunsingh/nord.nvim'
  use "EdenEast/nightfox.nvim"

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  use {
    'akinsho/bufferline.nvim', 
    tag = "*", requires = 'nvim-tree/nvim-web-devicons'
  }
  -- lsp functionality
  use {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
  }

  -- telescope helper packages
  use { 
     'nvim-telescope/telescope-fzf-native.nvim', 
     run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' 
  }

  -- run git commands 
  use 'dinhhuy258/git.nvim'

  -- toggle terminal
  use {"akinsho/toggleterm.nvim", tag = '*'}

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
