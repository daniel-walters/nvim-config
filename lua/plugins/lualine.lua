-- INFO: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#available-components
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { 'dashboard' },
        winbar = { 'dashboard' },
      },
      globalstatus = true,
      theme = 'tokyonight',
    },
    -- INFO: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#extensions
    extensions = {},
  },
}
