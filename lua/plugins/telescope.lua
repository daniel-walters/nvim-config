return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'live_grep_args')

    local builtin = require 'telescope.builtin'
    local opts = require('core.keymaps').opts
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, opts '[S]earch [H]elp')
    vim.keymap.set(
      'n',
      '<leader>sk',
      builtin.keymaps,
      opts '[S]earch [K]eymaps'
    )
    vim.keymap.set(
      'n',
      '<leader>sf',
      builtin.find_files,
      opts '[S]earch [F]iles'
    )
    vim.keymap.set(
      'n',
      '<leader>ss',
      builtin.builtin,
      opts '[S]earch [S]elect Telescope'
    )
    vim.keymap.set(
      'n',
      '<leader>sw',
      builtin.grep_string,
      opts '[S]earch current [W]ord'
    )
    vim.keymap.set(
      'n',
      '<leader>sg',
      builtin.live_grep,
      opts '[S]earch by [G]rep'
    )
    vim.keymap.set(
      'n',
      '<leader>sG',
      require('telescope').extensions.live_grep_args.live_grep_args,
      opts '[S]earch by [G]rep (with args)'
    )
    vim.keymap.set(
      'n',
      '<leader>sd',
      builtin.diagnostics,
      opts '[S]earch [D]iagnostics'
    )
    vim.keymap.set('n', '<leader>sr', builtin.resume, opts '[S]earch [R]esume')
    vim.keymap.set(
      'n',
      '<leader>s.',
      builtin.oldfiles,
      opts '[S]earch Recent Files ("." for repeat)'
    )
    vim.keymap.set(
      'n',
      '<leader><leader>',
      builtin.buffers,
      opts '[ ] Find existing buffers'
    )

    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(
        require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        }
      )
    end, opts '[/] Fuzzily search in current buffer')

    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, opts '[S]earch [/] in Open Files')

    vim.keymap.set('n', '<leader>s`', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, opts '[S]earch [N]eovim files')
  end,
}
