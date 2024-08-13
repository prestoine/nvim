local lspconfig = require('lspconfig')

-- Function to set up formatting on save
local function setup_formatting(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format_" .. bufnr, { clear = true }),
            buffer = bufnr,
            callback = function() 
                vim.lsp.buf.format({ bufnr = bufnr })
            end
        })
    end
end

-- General on_attach function
local on_attach = function(client, bufnr)
    setup_formatting(client, bufnr)
    -- Add any other on_attach functionality here
end

-- Python
lspconfig.pyright.setup{
    on_attach = on_attach
}

-- JavaScript/TypeScript
lspconfig.tsserver.setup{
    on_attach = on_attach
}

-- Rust
lspconfig.rust_analyzer.setup{
    on_attach = on_attach
}

-- Go
lspconfig.gopls.setup{
    on_attach = on_attach
}

-- HTML, CSS, and JSON
lspconfig.html.setup{
    on_attach = on_attach
}
lspconfig.cssls.setup{
    on_attach = on_attach
}
lspconfig.jsonls.setup{
    on_attach = on_attach
}

-- Astro
lspconfig.astro.setup{
    on_attach = on_attach
}

-- Create a global autocommand group for LSP
vim.api.nvim_create_augroup("LspAttach_formatting", {})

-- Set up autocommand to run on_attach for each buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_formatting",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        on_attach(client, bufnr)
    end,
})
