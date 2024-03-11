return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 90,
    },
    plugins = {
      tmux = {
        enabled = true,
      },
    },
  },
  keys = {
    { '<leader>z', ':ZenMode<CR>', desc = 'Open zen mode' },
  },
}
