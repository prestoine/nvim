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
map('n', '<Leader>s', ':w<CR>', opts)
map('n', '<Leader>q', ':q<CR>', opts)
map('n', '<Leader>qq', ':wa<CR>:qa<CR>', opts)

-- Telescope key mappings
map('n', '<Leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<Leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>fh', ':Telescope help_tags<CR>', opts)

--- File and content search using Telescope
map('n', '<Leader>fs', ':Telescope find_files<CR>', opts)
map('n', '<Leader>cs', ':Telescope live_grep<CR>', opts)


-- Open a new empty buffer and prompt for a filename to save
map('n', '<Leader>nf', '', { noremap = true, silent = true, callback = create_and_save_new_file })

-- Open a new tab and split windows
map('n', '<Leader>nt', ':tabnew<CR>', opts)
map('n', '<Leader>hw', ':split<CR>', opts)
map('n', '<Leader>vw', ':vsplit<CR>', opts)

--- Harpoon marking and accessing files
map('n', '<Leader>H', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<Leader>fl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<Leader><Tab>', ':lua require("harpoon.ui").nav_next()<CR>', opts)

--- Window and split management
map('n', '<Leader>nw', ':tabnew<CR>', opts)  -- Opens a new tab
map('n', '<Leader>hw', ':split<CR>', opts)   -- Horizontal split
map('n', '<Leader>vw', ':vsplit<CR>', opts)  -- Vertical split
map('n', '<Leader>l', '<C-w>l', opts)        -- Move to the right window
map('n', '<Leader>h', '<C-w>h', opts)        -- Move to the left window
map('n', '<Leader>j', '<C-w>j', opts)        -- Move to the lower window
map('n', '<Leader>k', '<C-w>k', opts)        -- Move to the upper window
map('n', '<Leader>w<Tab>', '<C-w>w', opts)   -- Cycle through windows

