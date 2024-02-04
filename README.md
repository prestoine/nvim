## Installation Instructions

#### Change your directory
##### If the path doesn't exist, create it.
```
cd ~/.config/nvim
```


#### Clone this repo
##### SSH
```
git clone git@github.com:desouzapreston/nvim.git
```
##### HTTPS
```
git clone https://github.com/desouzapreston/nvim.git
```

#### Put this at the end of your `~/.bashrc` file
##### Open the file
```
nvim ~/.bashrc
```
##### Add this block to the file
```
# Source NVim terminal customizations
if [ -f ~/.config/nvim/terminal/prompt.sh ]; then
    . ~/.config/nvim/terminal/prompt.sh
fi
```

#### Update the plugins
##### Open Neovim
```
nvim .
```
##### Get the plugins (press : to run Packer commands
```
:PackerInstall
```
```
:PackerUpdate
```
```
:PackerSync
```
##### Close Neovim and reopen it, use the keyboard shortcuts below, troubleshoot with GPT good luck!

### Keyboard shortcuts below.
#### If a couple of them don't make sense, ask chatgpt to walk you through a step-by-step tutorial, they're all important.

### Nvim Keybindings Cheat Sheet

#### File and Buffer Management
- **Save File**: `<Leader>s` - Saves the current buffer.
- **Quit Current Window**: `<Leader>c` - Closes the current window.
- **Save All and Quit**: `<Leader>q` - Saves all buffers and quits Neovim.

#### Navigation and Window Management
- **Move Right**: `<Leader>l` - Move to the window on the right.
- **Move Left**: `<Leader>h` - Move to the window on the left.
- **Move Down**: `<Leader>j` - Move to the window below.
- **Move Up**: `<Leader>k` - Move to the window above.
- **Horizontal Split**: `<Leader>wh` - Splits the window horizontally.
- **Vertical Split**: `<Leader>wv` - Splits the window vertically.
- **Resize Window**: `Ctrl + H/J/K/L` - Resize window in different directions.

#### Tabs and Sessions
- **New Tab**: `<Leader>nw` - Opens a new tab.
- **Switch Window by Number**: `<Leader>W1` to `<Leader>W9` - Switch to window by number.

#### NvimTree and File Explorer
- **Toggle NvimTree**: `<Leader>m` - Toggles the NvimTree file explorer.

#### Searching and Finding
- **Find Files**: `<Leader>fs` - Opens Telescope find files.
- **Grep Search**: `<Leader>gs` - Opens Telescope live grep.
- **List Buffers**: `<Leader>tb` - Opens Telescope buffers list.
- **Help Tags**: `<Leader>t?` - Opens Telescope help tags.

#### Harpoon
- **Mark File**: `<Leader>HH` - Marks the current file with Harpoon.
- **Harpoon Menu**: `<Leader>HL` - Toggles the Harpoon quick menu.
- **Navigate Harpoon Files**: `<Leader>H1` to `<Leader>H9` - Navigate to marked Harpoon file by number.

#### Git and LazyGit
- **Open LazyGit**: `<Leader>g` - Opens LazyGit in a split.

#### Terminal
- **Open Horizontal Terminal**: `<Leader>th` - Opens a terminal in a horizontal split.
- **Open Vertical Terminal**: `<Leader>tv` - Opens a terminal in a vertical split.
- **New Tab Terminal**: `<Leader>tt` - Opens a terminal in a new tab.
- **Exit Terminal Mode**: `Ctrl + t` - Exits terminal insert mode.

