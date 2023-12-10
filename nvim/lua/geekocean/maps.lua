require('geekocean/globalvariable')

local keymap = vim.keymap

-- set Space to leader
keymap.set('n', '<Space>', '<Nop>')
keymap.set('v', '<Space>', '<Nop>')
vim.g.mapleader = " "

-- maps ; to :
keymap.set('n', ';', ':')
keymap.set('v', ';', ':')

-- Increment / Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select All
-- keymap.set('n', '<C-a>', 'gg<S-v>G')

-- qucik move
keymap.set('n', 'H', '0')
keymap.set('n', 'L', '$')
keymap.set('v', 'H', '0')
keymap.set('v', 'L', '$')

-- Paste and yank
keymap.set('n', 'p', '"+p')
keymap.set('v', 'p', 'pgvy')
keymap.set('n', 'x', '"_x')
keymap.set('v', 'y', '\"+y')

keymap.set('i', 'jk', '<ESC>')

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- no highlight search
keymap.set('n', '<leader><CR>', '<cmd>nohlsearch<CR>', { silent = true })

-- new tab
keymap.set('n', 'te', ':tabedit')

-- close buffer
keymap.set('n', '<leader>bc', '<cmd>bd<CR>')

keymap.set('n', '<leader>sr', '<cmd>source<CR>', { silent = true })

-- Compile function
vim.api.nvim_set_keymap('n', '<leader>r', ';lua CompileRunGcc()<CR>', { silent = true })

function CompileRunGcc()
  vim.cmd('w')
  local filetype = vim.bo.filetype

  if filetype == 'c' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.cmd('res -5')
    vim.fn.termopen('gcc % -o %< && time ./%<')
  elseif filetype == 'cpp' then
    vim.cmd('set splitbelow')
    vim.cmd('!g++ -std=c++11 % -Wall -o %<')
    vim.cmd('sp')
    vim.cmd('res -15')
    vim.fn.termopen('./%<')
  elseif filetype == 'java' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.cmd('res -5')
    vim.fn.termopen('javac % && time java %<')
  elseif filetype == 'sh' then
    vim.cmd('!time bash %')
  elseif filetype == 'python' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.fn.termopen('python3 %')
  elseif filetype == 'html' then
    vim.cmd('silent! !' .. default_brower .. ' % &')
    -- elseif filetype == 'markdown' then
    --   vim.cmd('InstantMarkdownPreview')
    -- elseif filetype == 'tex' then
    --   vim.cmd('silent! VimtexStop')
    --   vim.cmd('silent! VimtexCompile')
    -- elseif filetype == 'dart' then
    --   vim.cmd('CocCommand flutter.run -d ' .. vim.g.flutter_default_device .. ' ' .. vim.g.flutter_run_args)
    --   vim.cmd('silent! CocCommand flutter.dev.openDevLog')
  elseif filetype == 'javascript' then
    vim.cmd('set splitbelow')
    vim.cmd('sp')
    vim.fn.termopen('export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .')
    -- elseif filetype == 'go' then
    --   vim.cmd('set splitbelow')
    --   vim.cmd('sp')
    --   vim.fn.termopen('go run .')
  end
end
