return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = { 'windwp/nvim-ts-autotag' },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash',
        'html',
        'go',
        'javascript',
        'json',
        'typescript',
        'jsdoc',
        'lua',
        'php',
        'markdown',
        'templ',
        'vim',
        'vimdoc',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      autotag = { enable = true },
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
