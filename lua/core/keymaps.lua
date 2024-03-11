local map = vim.keymap.set

-- Replace : with ;
map({ 'n', 'v' }, ';', ':')
map({ 'n', 'v' }, ':', ';')

-- Clear highlight
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Jump up and down 10 lines at a time
map({ 'n', 'v' }, '<S-k>', '10k')
map({ 'n', 'v' }, '<S-j>', '10j')

-- First/Last char
map({ 'n', 'v' }, '<S-h>', '^')
map({ 'n', 'v' }, '<S-l>', '$')

-- Alternate file
map('n', '<leader>0', '<C-^>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds navigation
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window movement
map('n', '<C-S-H>', '<C-w>H')

-- Split window
map('n', '<C-v>', ':vs<CR><C-W>L')
map('n', '<C-x>', ':sp<CR><C-W>J')
