local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Function to create and save a new file
local function create_and_save_new_file()
  vim.cmd('enew') -- Open a new empty buffer
  local filename = vim.fn.input('Enter new filename: ')
  if filename ~= '' then
    vim.cmd('write ' .. filename)
  end
end

-- Toggle NvimTree
map('n', '<Leader>m', ':NvimTreeToggle<CR>', opts)

-- Move between splits
map('n', '<Leader>l', '<C-w>l', opts)
map('n', '<Leader>h', '<C-w>h', opts)
map('n', '<Leader>j', '<C-w>j', opts)
map('n', '<Leader>k', '<C-w>k', opts)

-- Save and Quit
map('n', '<Leader>s', ':w<CR>', opts)  -- Save
map('n', '<Leader>q', ':q<CR>', opts)  -- Quit current window
map('n', '<Leader>Q', ':wa<CR>:qa<CR>', opts)  -- Save all and quit

-- Telescope key mappings
map('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)

-- Open a new empty buffer and prompt for a filename to save
map('n', '<Leader>nf', '', { noremap = true, silent = true, callback = create_and_save_new_file })

-- Open a new tab and split windows
map('n', '<Leader>hw', ':split<CR>', opts)   -- Horizontal split
map('n', '<Leader>vw', ':vsplit<CR>', opts)  -- Vertical split
-- Harpoon marking and accessing files
map('n', '<Leader>H', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<Leader>fl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<Leader><Tab>', ':lua require("harpoon.ui").nav_next()<CR>', opts)

-- Window and split management
map('n', '<Leader>hw', ':split<CR>', opts)   -- Horizontal split
map('n', '<Leader>vw', ':vsplit<CR>', opts)  -- Vertical split
map('n', '<Leader>l', '<C-w>l', opts)        -- Move to the right window
map('n', '<Leader>h', '<C-w>h', opts)        -- Move to the left window
map('n', '<Leader>j', '<C-w>j', opts)        -- Move to the lower window
map('n', '<Leader>k', '<C-w>k', opts)        -- Move to the upper window

-- Open LazyGit in a new split
map('n', '<Leader>g', ':LazyGit<CR>', opts)
 
