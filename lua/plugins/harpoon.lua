return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>ma',
      function()
        require('harpoon'):list():append()
      end,
      desc = '[M]ark [A]ppend to harpoon',
    },
    {
      '<leader>ml',
      function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end,
      desc = '[M]ark open harpoon [L]ist',
    },
    {
      '<leader>m1',
      function()
        require('harpoon'):list():select(1)
      end,
      desc = '[M]ark open [1]st file',
    },
    {
      '<leader>m2',
      function()
        require('harpoon'):list():select(2)
      end,
      desc = '[M]ark open [2]st file',
    },
    {
      '<leader>m3',
      function()
        require('harpoon'):list():select(3)
      end,
      desc = '[M]ark open [3]st file',
    },
    {
      '<leader>m4',
      function()
        require('harpoon'):list():select(4)
      end,
      desc = '[M]ark open [4]st file',
    },
  },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup {}
  end,
}
