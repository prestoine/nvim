local lspconfig = require('lspconfig')

-- Python
lspconfig.pyright.setup{}

-- JavaScript/TypeScript
lspconfig.tsserver.setup{}

-- Rust
lspconfig.rust_analyzer.setup{}

-- Go
lspconfig.gopls.setup{}

-- HTML, CSS, and JSON
lspconfig.html.setup{}
lspconfig.cssls.setup{}
lspconfig.jsonls.setup{}

