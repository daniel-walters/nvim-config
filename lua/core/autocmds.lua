--  INFO: `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable continuing commenstring on new line
vim.api.nvim_create_autocmd({ 'BufRead', 'BufWinEnter' }, {
  desc = 'Disable continuing comments onto a new line',
  group = vim.api.nvim_create_augroup('comment-new-line', { clear = true }),
  callback = function()
    vim.opt_local.formatoptions = 'tqj'
  end,
})
