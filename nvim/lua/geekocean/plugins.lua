local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  require("geekocean.plugins.colorscheme"),
  require("geekocean.plugins.statusline"),
  require("geekocean.plugins.lspconfig"),
  require("geekocean.plugins.comments"),
  require("geekocean.plugins.treesitter"),
  require("geekocean.plugins.editor"),
  require("geekocean.plugins.wilder"),
  require("geekocean.plugins.whichkey"),
  -- require("geekocean.plugins.notify"),
  require("geekocean.plugins.noice"),
  require("geekocean.plugins.telescope"),
  require("geekocean.plugins.wakatime"),
  require("geekocean.plugins.null_ls"),
  -- require("geekocean.plugins.aicode"),
  require("geekocean.plugins.snippets"),
})
