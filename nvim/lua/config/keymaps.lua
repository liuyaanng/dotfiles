-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- maps ; to :
keymap.set("n", ";", ":")
keymap.set("v", ";", ":")

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select All
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- qucik move
keymap.set("n", "H", "0")
keymap.set("n", "L", "$")
keymap.set("v", "H", "0")
keymap.set("v", "L", "$")

-- Paste and yank
keymap.set("n", "p", '"+p')
keymap.set("v", "p", "pgvy")
keymap.set("n", "x", '"_x')
keymap.set("v", "y", '"+y')

keymap.set("i", "jk", "<ESC>")

keymap.set(
  "i",
  "jk",
  'pumvisible() ? "<C-e><ESC>" : v:lua.check_buftype()',
  { expr = true, noremap = true, silent = true }
)

function _G.check_buftype()
  if vim.bo.buftype == "" then
    -- It's a normal buffer, save and exit insert mode
    return "<ESC>:w<CR>"
  else
    -- It's a special buffer, just exit insert mode without saving
    return "<ESC>"
  end
end

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- new tab
keymap.set("n", "te", ":tabedit")

-- close buffer
keymap.set("n", "<leader>bc", "<cmd>bd<CR>")

keymap.set("n", "<leader>sr", "<cmd>source<CR>", { silent = true })
