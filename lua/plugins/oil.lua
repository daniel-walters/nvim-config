return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  keys = {
    { '<leader>fe', '<cmd>Oil<cr>', desc = '[F]ile [E]xplorer' },
  },
  opts = {
    columns = {
      'permissions',
      'size',
      'icon',
    },
    keymaps = {
      ['<C-v>'] = 'actions.select_vsplit',
      ['<C-x>'] = 'actions.select_split',
      ['q'] = 'actions.close',
    },
    -- Dont permanently delete files
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
