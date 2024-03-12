return {
  'folke/noice.nvim',
  -- TODO: This causes the startup screen to get wiped
  -- event = 'VeryLazy',
  opts = {
    lsp = {
      -- override markdown rendering so that and other plugins use Treesitter
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
