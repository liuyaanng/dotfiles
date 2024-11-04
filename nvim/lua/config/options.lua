-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local option = vim.opt
local buffer = vim.b
local global = vim.g

-- encoding
vim.scriptencoding = "utf-8"
option.encoding = "utf-8"
option.fileencoding = "utf-8"

-- undo
option.undofile = true
option.undodir = vim.fn.expand("$HOME/.local/share/nvim/undo")

option.scrolloff = 10
option.backupskip = { "/tmp/*", "/private/tmp/*" }
option.inccommand = "split"
option.ignorecase = true
option.wrap = true -- No Warp Lines
option.linebreak = true
option.backspace = { "start", "eol", "indent" }
option.path:append({ "**" }) -- Finding Files - Serach down into subfolders
option.wildignore:append({ "*/node_modules/*, *.bak, *.swp, tmp/" })
option.list = true
option.listchars = "tab:›·,trail:▫"

-- encoding
vim.scriptencoding = "utf-8"
option.encoding = "utf-8"
option.fileencoding = "utf-8"

-- python3
global.python3_host_prog = "/opt/miniconda3/envs/llm/bin/python3"
