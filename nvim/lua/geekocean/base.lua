vim.cmd("autocmd!")

local option = vim.opt
local buffer = vim.b
local global = vim.g

option.mouse = ''
option.showmode = false
option.title = true -- show file title in terminal window

-- encoding
vim.scriptencoding = 'utf-8'
option.encoding = 'utf-8'
option.fileencoding = 'utf-8'

-- line number
option.number = true
option.relativenumber = true
-- indent and tab
option.autoindent = true
option.smartindent = true -- support for vim, not for neovim
option.breakindent = true

option.smarttab = true
option.shiftwidth = 2 -- auto indent width
option.tabstop = 2    -- tab indent width

-- undo
option.undofile = true
option.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo')

option.splitright = true
option.hlsearch = true -- highlight search
option.backup = false
option.showcmd = true
option.cmdheight = 1
option.laststatus = 2
option.expandtab = true
option.scrolloff = 10
-- vim.opt.shell = 'zsh'
option.backupskip = { '/tmp/*', '/private/tmp/*' }
option.inccommand = 'split'
option.ignorecase = true
option.wrap = false         -- No Warp Lines
option.backspace = { 'start', 'eol', 'indent' }
option.path:append { '**' } -- Finding Files - Serach down into subfolders
option.wildignore:append { '*/node_modules/*, *.bak, *.swp, tmp/' }
option.list = true
option.listchars = "tab:›·,trail:▫"

-- show terminal color
option.termguicolors = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving Insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
option.formatoptions:append { 'r' }
