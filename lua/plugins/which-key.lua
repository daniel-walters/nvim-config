return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local which_key = require 'which-key'

    which_key.setup { notify = false }

    which_key.register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ile', _ = 'which_key_ignore' },
      ['<leader>m'] = { name = '[M]ark', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]otes', _ = 'which_key_ignore' },
    }
  end,
}
