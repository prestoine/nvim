local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- File and content search using Telescope
map('n', '<Leader>fs', ':Telescope find_files<CR>', opts)
map('n', '<Leader>cs', ':Telescope live_grep<CR>', opts)

-- Open a new empty buffer
map('n', '<Leader>nf', ':enew<CR>', opts)

-- Harpoon marking and accessing files
map('n', '<Leader>H', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<Leader>fl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<Leader><Tab>', ':lua require("harpoon.ui").nav_next()<CR>', opts)

-- Window and split management
map('n', '<Leader>nw', ':tabnew<CR>', opts)  -- Opens a new tab
map('n', '<Leader>hw', ':split<CR>', opts)   -- Horizontal split
map('n', '<Leader>vw', ':vsplit<CR>', opts)  -- Vertical split
map('n', '<Leader>l', '<C-w>l', opts)        -- Move to the right window
map('n', '<Leader>h', '<C-w>h', opts)        -- Move to the left window
map('n', '<Leader>j', '<C-w>j', opts)        -- Move to the lower window
map('n', '<Leader>k', '<C-w>k', opts)        -- Move to the upper window
map('n', '<Leader>w<Tab>', '<C-w>w', opts)   -- Cycle through windows

-- Quit and save
map('n', '<Leader>q', ':q<CR>', opts)        -- Quit current window
map('n', '<Leader>s', ':w<CR>', opts)        -- Save current file

-- NvimTree and additional functionalities
map('n', '<Leader>r', ':NvimTreeRename<CR>', opts)  -- Rename with NvimTree, make sure NvimTree is configured to support this
-- The following commands might require custom functions or additional plugins
-- map('n', '<Leader>dd', ':YourDeleteDirectoryCommand<CR>', opts)
-- map('n', '<Leader>co', ':YourCopyFileDirectoryCommand<CR>', opts)
-- map('n', '<Leader>pa', ':YourPasteFileDirectoryCommand<CR>', opts)
-- map('n', '<Leader>cu', ':YourCutFileDirectoryCommand<CR>', opts)

