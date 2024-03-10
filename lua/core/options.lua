vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- INFO: `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

-- Mode is in status line already
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Set highlight on search
vim.opt.hlsearch = true

-- Show column 80 columns in to measure line length
vim.opt.colorcolumn = '80'

-- Confirm dialog for unsafe actions
vim.opt.confirm = true

-- :cd goes to $HOME
vim.opt.cdhome = true

-- Only have one status bar across multiple windows
vim.opt.laststatus = 3

-- 24bit RGB
vim.opt.termguicolors = true
