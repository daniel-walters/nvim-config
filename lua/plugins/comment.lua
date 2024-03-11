return {
  'numToStr/Comment.nvim',
  dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
  keys = {
    { 'gc', mode = { 'n', 'v' }, desc = 'Comment toggle linewise' },
    { 'gb', mode = { 'n', 'v' }, desc = 'Comment toggle blockwise' },
  },
  opts = function()
    return {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
}
