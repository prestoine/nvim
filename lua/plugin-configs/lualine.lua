require('lualine').setup {
  options = {
    theme = 'gruvbox', -- or any other theme you prefer
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {'diagnostics', sources={'nvim_diagnostic'}}},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

