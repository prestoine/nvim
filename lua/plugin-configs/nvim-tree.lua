-- Disable all auto-opening behaviors
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_hijack_netrw = 0

-- This is critical: configure nvim-tree to NOT open automatically for directories
require('nvim-tree').setup({
  -- Explicitly disable directory handling
  disable_netrw = true,
  hijack_netrw = false,
  hijack_directories = { 
    enable = false,
    auto_open = false,
  },
  update_cwd = false,
  auto_reload_on_write = true,
  
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    side = 'left',
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash-put",
    require_confirm = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})

-- Ensure these global settings take effect
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_hijack_netrw = 0
