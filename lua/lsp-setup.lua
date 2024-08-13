local lspconfig = require('lspconfig')

-- Function to set up formatting on save
local function setup_formatting(client, bufnr)
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format_" .. bufnr, { clear = true }),
            buffer = bufnr,
            callback = function() 
                vim.lsp.buf.format({ 
                    bufnr = bufnr,
                    timeout_ms = 5000  -- Set a 5-second timeout
                })
            end
        })
    end
end

-- General on_attach function
local on_attach = function(client, bufnr)
    setup_formatting(client, bufnr)
    -- Add any other on_attach functionality here
end

-- Common LSP setup options
local lsp_flags = {
    debounce_text_changes = 150,
}

-- Python
lspconfig.pyright.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- JavaScript/TypeScript
lspconfig.tsserver.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Rust
lspconfig.rust_analyzer.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Go
lspconfig.gopls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- HTML, CSS, and JSON
lspconfig.html.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig.cssls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
lspconfig.jsonls.setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

-- Astro
lspconfig.astro.setup{
    on_attach = on_attach,
    flags = lsp_flags,
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

-- Preload LSP servers
local preload_lsp_servers = {'astro', 'tsserver', 'html', 'cssls'}
for _, server in ipairs(preload_lsp_servers) do
    lspconfig[server].setup{}
end
