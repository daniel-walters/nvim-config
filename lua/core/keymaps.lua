local map = vim.keymap.set

local function opts(desc)
  if desc == nil then
    return { noremap = true, silent = true }
  end

  return { noremap = true, silent = true, desc = desc }
end

-- Replace : with ;
map({ 'n', 'v' }, ';', ':')
map({ 'n', 'v' }, ':', ';')

-- Clear highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>', opts())

-- Jump up and down 10 lines at a time
map({ 'n', 'v' }, '<S-k>', '10k', opts())
map({ 'n', 'v' }, '<S-j>', '10j', opts())

-- First/Last char
map({ 'n', 'v' }, '<S-h>', '^', opts())
map({ 'n', 'v' }, '<S-l>', '$', opts())

-- Alternate file
map('n', '<leader>0', '<C-^>', opts 'Go to alternate file')

-- Diagnostic keymaps
map(
  'n',
  '[d',
  vim.diagnostic.goto_prev,
  opts 'Go to previous [D]iagnostic message'
)
map('n', ']d', vim.diagnostic.goto_next, opts 'Go to next [D]iagnostic message')
map(
  'n',
  '<leader>e',
  vim.diagnostic.open_float,
  opts 'Show diagnostic [E]rror messages'
)
map(
  'n',
  '<leader>q',
  vim.diagnostic.setloclist,
  opts 'Open diagnostic [Q]uickfix list'
)

-- Keybinds navigation
map('n', '<C-h>', '<C-w><C-h>', opts 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', opts 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', opts 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', opts 'Move focus to the upper window')

-- Window movement
map('n', '<C-S-H>', '<C-w>H', opts())

-- Split window
map('n', '<C-v>', ':vs<CR><C-W>L', opts())
map('n', '<C-x>', ':sp<CR><C-W>J', opts())

return {
  opts = opts,
}
