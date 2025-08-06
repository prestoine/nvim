# Modern Neovim Configuration

A complete Neovim setup with LSP, Telescope, Treesitter, and essential development plugins.

## ✨ Features

- **LSP Integration** - Full language server protocol support
- **Telescope** - Fuzzy finder for files, grep, buffers, and more
- **Treesitter** - Advanced syntax highlighting and parsing
- **Harpoon** - Quick file navigation and marking
- **NvimTree** - File explorer with git integration
- **Alpha Dashboard** - Beautiful startup screen
- **LazyGit Integration** - Git workflow directly in Neovim
- **GitHub Copilot** - AI-powered code completion
- **Multiple Themes** - Gruvbox, OneDark, Dracula, Palenight, Ayu, Sonokai

## 📋 Prerequisites

Before installing this Neovim configuration, ensure you have:

```bash
# Required
- Neovim (0.9 or newer)
- Git
- Node.js and npm (for LSP servers)
- ripgrep (for Telescope live grep)
- fd (for Telescope file finding)

# Optional but recommended
- A Nerd Font (for icons)
- lazygit (for git integration)
```

### Install Prerequisites (Ubuntu/Debian)
```bash
# Install ripgrep and fd
sudo apt update
sudo apt install ripgrep fd-find

# Install Node.js (if not already installed)
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
```

## 🚀 Installation

### 1. Backup Existing Configuration
```bash
# Backup your current Neovim config (if it exists)
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
```

### 2. Clone This Configuration
```bash
# Clone directly to your Neovim config directory
git clone https://github.com/prestoine/nvim.git ~/.config/nvim
```

### 3. Install Language Servers
```bash
# Install common language servers
npm install -g typescript typescript-language-server vscode-langservers-extracted pyright bash-language-server
```

### 4. First Launch
```bash
# Start Neovim - Packer will auto-install on first run
nvim

# If plugins don't install automatically, run:
:PackerInstall
:PackerSync
```

### 5. Install Terminal Customizations (Optional)
If you want the custom terminal prompt, add this to your `~/.bashrc`:
```bash
# Source Neovim terminal customizations
if [ -f ~/.config/nvim/terminal/prompt.sh ]; then
    . ~/.config/nvim/terminal/prompt.sh
fi
```

## ⌨️ Keybindings

**Leader Key:** `<Space>`

### File Management
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>s` | Save File | Saves the current buffer |
| `<Leader>c` | Quit Window | Closes the current window |
| `<Leader>q` | Save All & Quit | Saves all buffers and quits Neovim |
| `<Leader>m` | Toggle File Tree | Toggles NvimTree file explorer |

### Navigation & Window Management
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>h/j/k/l` | Move Between Windows | Navigate to left/down/up/right window |
| `<Leader>wh` | Horizontal Split | Split window horizontally |
| `<Leader>wv` | Vertical Split | Split window vertically |
| `<Ctrl>h/j/k/l` | Resize Windows | Resize current window |
| `<Alt>h/j/k/l` | Snap Windows | Move window to edge |

### Tabs & Sessions
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>nw` | New Tab | Opens a new tab |
| `<Leader>w1-9` | Switch Tabs | Switch to tab by number (1-9) |

### Search & Find (Telescope)
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>fs` | Find Files | Open file finder |
| `<Leader>gs` | Live Grep | Search text across project |
| `<Leader>tb` | List Buffers | Show open buffers |
| `<Leader>t?` | Help Tags | Search help documentation |

### Harpoon (Quick File Access)
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>HH` | Mark File | Add current file to Harpoon |
| `<Leader>HL` | Harpoon Menu | Show Harpoon quick menu |
| `<Leader>1-9` | Navigate Files | Jump to Harpoon file by number |
| `<Leader><Tab>` | Next Harpoon | Navigate to next Harpoon file |

### Git Integration
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>g` | LazyGit | Open LazyGit in split |

### Terminal
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>th` | Horizontal Terminal | Open terminal in horizontal split |
| `<Leader>tv` | Vertical Terminal | Open terminal in vertical split |
| `<Leader>tt` | Tab Terminal | Open terminal in new tab |
| `<Ctrl>t` | Exit Terminal Mode | Return to normal mode from terminal |

### Text Editing
| Key | Action | Description |
|-----|--------|-------------|
| `<Leader>R` | Replace Word | Replace all instances of word under cursor |

## 🎨 Themes

Available colorschemes:
- **sonokai** (default)
- gruvbox
- onedark
- dracula  
- palenight
- ayu

To change theme, edit `~/.config/nvim/init.lua`:
```lua
vim.cmd('colorscheme your-theme-name')
```

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration file
├── lua/
│   ├── keymappings.lua         # All keybindings
│   ├── lsp-setup.lua          # LSP configuration
│   └── plugin-configs/        # Individual plugin configs
│       ├── alpha.lua          # Dashboard configuration
│       ├── lualine.lua        # Statusline configuration
│       ├── nvim-tree.lua      # File explorer configuration
│       ├── telescope.lua      # Fuzzy finder configuration
│       └── treesitter.lua     # Syntax highlighting
├── pack/github/start/
│   └── copilot.vim           # GitHub Copilot
├── plugin/
│   └── packer_compiled.lua   # Compiled plugin configuration
├── terminal/
│   └── prompt.sh             # Custom terminal prompt
└── README.md                 # This file
```

## 🔧 Customization

### Adding New Plugins
Edit `~/.config/nvim/init.lua` and add to the packer section:
```lua
packer.startup(function(use)
    -- Your existing plugins...
    use 'author/plugin-name'  -- Add new plugin here
end)
```

Then run `:PackerInstall` in Neovim.

### Modifying Keybindings
Edit `~/.config/nvim/lua/keymappings.lua`:
```lua
map('n', '<Leader>your-key', ':YourCommand<CR>', opts)
```

### LSP Configuration
Language servers are configured in `~/.config/nvim/lua/lsp-setup.lua`.

## 📦 Included Plugins

### Core Functionality
- **packer.nvim** - Plugin manager
- **nvim-lspconfig** - LSP client configurations
- **nvim-cmp** - Autocompletion engine
- **LuaSnip** - Snippet engine
- **nvim-treesitter** - Syntax highlighting and parsing

### File Management & Navigation
- **nvim-tree.lua** - File explorer
- **telescope.nvim** - Fuzzy finder
- **harpoon** - Quick file navigation

### Git Integration
- **lazygit.nvim** - Git workflow integration
- **gitsigns.nvim** - Git signs in gutter

### UI & Appearance
- **alpha-nvim** - Dashboard/start screen
- **lualine.nvim** - Statusline
- **indent-blankline.nvim** - Indentation guides
- **nvim-colorizer.lua** - Color highlighting

### Development Tools
- **copilot.vim** - GitHub Copilot AI assistance
- **Comment.nvim** - Easy commenting
- **nvim-autopairs** - Auto-close brackets
- **which-key.nvim** - Keybinding hints
- **goyo.vim** - Distraction-free writing

## 🐛 Troubleshooting

### Plugins Not Installing
```bash
# In Neovim, run:
:PackerClean
:PackerInstall
:PackerSync
```

### LSP Not Working
```bash
# Check if language servers are installed:
:LspInfo

# Install missing language servers with npm
npm install -g typescript-language-server pyright
```

### Telescope Not Finding Files
Ensure `ripgrep` and `fd` are installed:
```bash
sudo apt install ripgrep fd-find
```

### Terminal Transparency Issues
The config includes transparency settings. If you prefer opaque backgrounds, comment out these lines in `init.lua`:
```lua
-- vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
-- vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')
```

## 🚀 Getting Started

1. **Start with files**: Use `<Leader>fs` to find and open files
2. **Navigate projects**: Use `<Leader>m` to toggle the file tree
3. **Mark important files**: Use `<Leader>HH` to mark files with Harpoon
4. **Search in project**: Use `<Leader>gs` to search text across files
5. **Git workflow**: Use `<Leader>g` to open LazyGit
6. **Terminal access**: Use `<Leader>tt` for a terminal in new tab

## 📚 Learning Resources

For Neovim beginners:
- Run `:Tutor` in Neovim for basic Vim tutorial
- Use `:help` followed by any command to get help
- Check out the [Neovim documentation](https://neovim.io/doc/)

---

**Philosophy**: This configuration balances power with simplicity, providing a modern development environment while maintaining Neovim's efficiency and speed.
