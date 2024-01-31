-- Setting the spacebar as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true

-- Terminal background transparency
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')  -- Set normal background to transparent
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')  -- Set line number background to transparent


-- Packer bootstrap code
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth', '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Plugins
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'numToStr/Comment.nvim'
  use 'kdheepak/lazygit.nvim'
  use { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'morhetz/gruvbox'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'windwp/nvim-autopairs'
  use 'folke/which-key.nvim'
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require'colorizer'.setup() end,
  }



  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

-- Load key mappings and plugin configurations
require('keymappings')
require('plugin-configs.treesitter')
require('plugin-configs.lualine')
require('plugin-configs.nvim-tree')
require('plugin-configs.telescope')

