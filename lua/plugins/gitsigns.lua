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
        '<leader>gb',
        gitsigns.toggle_current_line_blame,
        { desc = '[G]it toggle [B]lame' }
      )

      vim.keymap.set(
        'n',
        '<leader>gp',
        gitsigns.preview_hunk,
        { desc = '[G]it [P]review hunk' }
      )

      vim.keymap.set(
        'n',
        '<leader>gd',
        gitsigns.diffthis,
        { desc = '[G]it show [D]iff (last commit)' }
      )

      vim.keymap.set('n', '<leader>gD', function()
        gitsigns.diffthis '~'
      end, { desc = '[G]it show [D]iff (last push)' })
    end,
  },
}
