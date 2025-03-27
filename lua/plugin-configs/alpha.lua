local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

-- Matrix green colors
local matrix_green = "#00FF00"
local matrix_dark_green = "#005500"

-- Generate binary for digital rain
local function generate_binary(length)
    local result = ""
    for i = 1, length do
        result = result .. (math.random() > 0.5 and "1" or "0")
    end
    return result
end

-- Set random seed
math.randomseed(os.time())

-- Matrix quotes
local matrix_quotes = {
    "There is no spoon.",
    "Welcome to the desert of the real.",
    "Free your mind.",
    "What is real? How do you define real?",
    "Never send a human to do a machine's job.",
    "The Matrix is everywhere, it is all around us.",
    "I'm trying to free your mind, Neo. But I can only show you the door.",
    "You're the One, Neo.",
    "The Matrix has you...",
    "Follow the white rabbit.",
    "Knock, knock...",
    "I know you're out there...",
    "I can feel you now..."
}

-- Random quote
local random_quote = matrix_quotes[math.random(#matrix_quotes)]

-- Create binary rain lines
local binary_line = generate_binary(80)

-- Create header with WAKE UP NEO ASCII art
dashboard.section.header.val = {
    binary_line,
    binary_line,
    binary_line,
    " ██╗    ██╗ █████╗ ██╗  ██╗███████╗    ██╗   ██╗██████╗  ",
    " ██║    ██║██╔══██╗██║ ██╔╝██╔════╝    ██║   ██║██╔══██╗ ",
    " ██║ █╗ ██║███████║█████╔╝ █████╗      ██║   ██║██████╔╝ ",
    " ██║███╗██║██╔══██║██╔═██╗ ██╔══╝      ██║   ██║██╔═══╝  ",
    " ╚███╔███╔╝██║  ██║██║  ██╗███████╗    ╚██████╔╝██║      ",
    "  ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝     ╚═════╝ ╚═╝      ",
    "  ███╗   ██╗███████╗ ██████╗                             ",
    "  ████╗  ██║██╔════╝██╔═══██╗                            ",
    "  ██╔██╗ ██║█████╗  ██║   ██║                            ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║                            ",
    "  ██║ ╚████║███████╗╚██████╔╝                            ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝                             ",
    binary_line,
    binary_line,
    binary_line,
    "",
    random_quote,
    "",
}

-- Set highlights
vim.cmd("highlight AlphaHeader guifg=" .. matrix_green)
vim.cmd("highlight AlphaBinary guifg=" .. matrix_dark_green)
vim.cmd("highlight AlphaMatrixBorder guifg=" .. matrix_green)
vim.cmd("highlight AlphaMatrixText guifg=" .. matrix_green)

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.header.opts.position = "center"

-- Create compact terminal box
dashboard.section.buttons.val = {
    { type = "text", val = "╭" .. string.rep("─", 58) .. "╮", opts = { hl = "AlphaMatrixBorder", position = "center" }},
    { type = "text", val = "│ > CONNECTING TO THE MATRIX...                          │", opts = { hl = "AlphaMatrixText", position = "center" }},
    { type = "text", val = "│ > BYPASSING SECURITY PROTOCOLS...                      │", opts = { hl = "AlphaMatrixText", position = "center" }},
    { type = "text", val = "│ > ESTABLISHING SECURE CONNECTION...                    │", opts = { hl = "AlphaMatrixText", position = "center" }},
    { type = "text", val = "│ > SIGNAL ESTABLISHED                                   │", opts = { hl = "AlphaMatrixText", position = "center" }},
    { type = "text", val = "│                  [Enter the Matrix]                    │", opts = { hl = "AlphaMatrixText", position = "center" }},
    { type = "text", val = "╰" .. string.rep("─", 58) .. "╯", opts = { hl = "AlphaMatrixBorder", position = "center" }},
}

-- No footer
dashboard.section.footer.val = ""

-- Minimal layout with less padding
dashboard.config.layout = {
    { type = "padding", val = 1 },
    dashboard.section.header,
    { type = "padding", val = 1 },
    dashboard.section.buttons,
    { type = "padding", val = 0 },
}

-- Set positioning options for better overall centering
dashboard.config.opts = {
    margin = 5,
    noautocmd = true,
}

-- Setup alpha
alpha.setup(dashboard.config)
