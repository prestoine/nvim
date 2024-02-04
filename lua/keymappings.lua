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
map('n', '<Leader>c', ':q<CR>', opts)  -- Quit current window
map('n', '<Leader>q', ':wa<CR>:qa<CR>', opts)  -- Save all and quit

-- Telescope key mappings
map('n', '<Leader>fs', ':Telescope find_files<CR>', opts)
map('n', '<Leader>gs', ':Telescope live_grep<CR>', opts)
map('n', '<Leader>tb', ':Telescope buffers<CR>', opts)
map('n', '<Leader>t?', ':Telescope help_tags<CR>', opts)

-- Open a new empty buffer and prompt for a filename to save
-- not working, opens in wrong location: map('n', '<Leader>nf', '', { noremap = true, silent = true, callback = create_and_save_new_file })

-- Harpoon marking and accessing files
map('n', '<Leader>HH', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<Leader>HL', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<Leader><Tab>', ':lua require("harpoon.ui").nav_next()<CR>', opts)

-- Access Harpoon marked files with <Leader>h<number>
for i = 1, 9 do
    map('n', '<Leader>H' .. i, ':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>', opts)
end

-- Window and split management
map('n', '<Leader>wh', ':split<CR>', opts)   -- Horizontal split
map('n', '<Leader>wv', ':vsplit<CR>', opts)  -- Vertical split

-- Open LazyGit in a new split
map('n', '<Leader>g', ':LazyGit<CR>', opts)

-- Open terminal in a horizontal split
map('n', '<Leader>th', ':split | terminal<CR>', opts)

-- Open terminal in a vertical split
map('n', '<Leader>tv', ':vsplit | terminal<CR>', opts)

-- Resize with Ctrl + HJKL
map('n', '<C-h>', ':vertical resize -2<CR>', opts)  -- Shrink window left
map('n', '<C-j>', ':resize +2<CR>', opts)           -- Grow window down
map('n', '<C-k>', ':resize -2<CR>', opts)           -- Shrink window up
map('n', '<C-l>', ':vertical resize +2<CR>', opts)  -- Grow window right

-- Snap windows with Alt+H/J/K/L
map('n', '<A-h>', '<C-W>H', opts)
map('n', '<A-j>', '<C-W>J', opts)
map('n', '<A-k>', '<C-W>K', opts)
map('n', '<A-l>', '<C-W>L', opts)

-- New tab
map('n', '<Leader>nw', ':tabnew<CR>', opts)

-- Switch to specific window number
for i = 1, 9 do
    map('n', '<Leader>W'..i, i..'gt', opts)
end

-- terminal in new tab
map('n', '<Leader>tt', ':tabnew | terminal<CR>', opts)

-- Exit terminal mode with `Ctrl-g`
vim.api.nvim_set_keymap('t', '<C-t>', [[<C-\><C-n>]], {noremap = true, silent = true})

--Open DB GUI
vim.api.nvim_set_keymap('n', '<Leader>db', ':DBUI<CR>', {noremap = true, silent = true})
