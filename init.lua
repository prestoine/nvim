-- Setting the spacebar as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.termguicolors = true

-- Terminal background transparency
vim.cmd('hi Normal guibg=NONE ctermbg=NONE')  -- Set normal background to transparent
vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')  -- Set line number background to transparent

-- TPL Files
vim.cmd([[
  autocmd BufRead,BufNewFile *.conf.tpl set filetype=terraform
]])

-- Enable line wrapping
vim.wo.wrap = true

-- Wrap lines at word boundaries
vim.o.linebreak = true

-- Set indentation levels
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true -- Convert tabs to spaces

-- Set characters considered for wrapping (spaces and tabs by default)
vim.o.breakat = [[\ \	]]

-- Configure continuation indentation for wrapped lines
vim.o.breakindent = true
vim.o.breakindentopt = 'shift:2,min:20'
vim.o.showbreak = string.rep(' ', 3) -- Indent wrapped lines

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

    use 'junegunn/goyo.vim'
    use 'github/copilot.vim'
    use 'neovim/nvim-lspconfig'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'morhetz/gruvbox'
    use 'joshdick/onedark.vim'
    use 'dracula/vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'ayu-theme/ayu-vim'
    use 'sainnhe/sonokai'

	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)

vim.cmd('colorscheme sonokai')

-- Load key mappings and plugin configurations
require('keymappings')
require('plugin-configs.treesitter')
require('plugin-configs.lualine')
require('plugin-configs.nvim-tree')
require('plugin-configs.telescope')
require('lsp-setup')
