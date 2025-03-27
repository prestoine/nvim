local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Matrix green color
local matrix_green = "#00FF00"

-- Matrix-style header with cleaner ASCII art
dashboard.section.header.val = {
    [[                                                                     ]],
    [[   ██╗    ██╗ █████╗ ██╗  ██╗███████╗    ██╗   ██╗██████╗           ]],
    [[   ██║    ██║██╔══██╗██║ ██╔╝██╔════╝    ██║   ██║██╔══██╗          ]],
    [[   ██║ █╗ ██║███████║█████╔╝ █████╗      ██║   ██║██████╔╝          ]],
    [[   ██║███╗██║██╔══██║██╔═██╗ ██╔══╝      ██║   ██║██╔═══╝           ]],
    [[   ╚███╔███╔╝██║  ██║██║  ██╗███████╗    ╚██████╔╝██║               ]],
    [[    ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═╝               ]],
    [[                                                                     ]],
    [[    ███╗   ██╗███████╗ ██████╗                                      ]],
    [[    ████╗  ██║██╔════╝██╔═══██╗                                     ]],
    [[    ██╔██╗ ██║█████╗  ██║   ██║                                     ]],
    [[    ██║╚██╗██║██╔══╝  ██║   ██║                                     ]],
    [[    ██║ ╚████║███████╗╚██████╔╝                                     ]],
    [[    ╚═╝  ╚═══╝╚══════╝ ╚═════╝                                      ]],
    [[                                                                     ]],
    [[    The Matrix has you...                                           ]],
    [[    Follow the white rabbit.                                        ]],
    [[                                                                     ]],
    [[    Knock, knock...                                                 ]],
    [[                                                                     ]],
}

-- Set the header color to matrix green
vim.cmd("highlight AlphaHeader guifg=" .. matrix_green)
dashboard.section.header.opts.hl = "AlphaHeader"

-- Custom buttons with Matrix-inspired descriptions
dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
    dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "  File tree", ":NvimTreeToggle<CR>"),
    dashboard.button("g", "  Find text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "  Config", ":e $MYVIMRC<CR>"),
    dashboard.button("l", "  LazyGit", ":LazyGit<CR>"),
    dashboard.button("q", "  Exit the Matrix", ":qa<CR>"),
}

-- Matrix styling for buttons
vim.cmd("highlight AlphaButtons guifg=#88FF88")
vim.cmd("highlight AlphaShortcut guifg=#FFFF00")
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"

-- Footer with Matrix quote
dashboard.section.footer.val = {
    [[                                                                     ]],
    [[    I'm trying to free your mind, Neo.                              ]],
    [[    But I can only show you the door.                               ]],
    [[    You're the one that has to walk through it.                     ]],
    [[                                                                     ]],
}
vim.cmd("highlight AlphaFooter guifg=#56E98E")
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Configure dashboard layout
dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
}

-- Set menu configuration
dashboard.config.opts.noautocmd = true

-- Setup alpha
alpha.setup(dashboard.config)

-- Define a simple function to start Alpha
_G.start_alpha = function()
    vim.cmd('Alpha')
end
