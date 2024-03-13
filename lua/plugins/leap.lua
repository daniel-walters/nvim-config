return {
  'ggandor/leap.nvim',
  dependencies = 'tpope/vim-repeat',
  event = 'BufEnter',
  config = function()
    require('leap').create_default_mappings()
    require('leap').opts.special_keys.prev_target = '<bs>'
    require('leap').opts.special_keys.prev_group = '<bs>'
    require('leap.user').set_repeat_keys('<cr>', '<bs>')
  end,
}
