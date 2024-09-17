require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "python", "javascript", "typescript", "html", "css", "bash", "json", "yaml", "go", "rust", "markdown", "vim", "vimdoc", "query", "terraform", "hcl"}, 
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true, -- Enable Treesitter-based syntax highlighting
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true, -- Enable Treesitter-based indentation
  },
}


