local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

-- vim.opt.runtimepath:append("$HOME/.local/share/treesitter")

ts.setup {
  -- parser_install_dir = "$HOME/.local/share/treesitter",
  sync_install = false,
  auto_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "python",
    "markdown",
    "markdown_inline"
  },
  autotag = {
    enable = true
  },
  modules = {}
}
