-- INFO: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#available-components
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- TODO: This causes the startup screen to get wiped
  -- event = 'VeryLazy',
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { '' },
        winbar = { '' },
      },
      globalstatus = true,
    },
    -- INFO: https://github.com/nvim-lualine/lualine.nvim?tab=readme-ov-file#extensions
    extensions = {},
  },
}
