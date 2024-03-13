return {
  'lewis6991/gitsigns.nvim',
  event = 'BufRead',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    current_line_blame_opts = {
      delay = 0,
    },
    on_attach = function()
      local gitsigns = package.loaded.gitsigns

      vim.keymap.set(
        'n',
        '<leader>b',
        gitsigns.toggle_current_line_blame,
        { desc = 'Toggle line blame' }
      )

      vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)
    end,
  },
}
