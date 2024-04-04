return {
  'folke/neodev.nvim',
  event = 'VimEnter',
  opts = {
    library = {
      plugins = {
        'nvim-dap-ui',
      },
      types = true,
    },
  },
}
