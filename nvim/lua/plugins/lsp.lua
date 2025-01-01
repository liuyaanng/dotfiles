return {
  {
    -- mason
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        --- lua
        "lua-language-server",
        "stylua",
        "luacheck",
        --- css
        "css-lsp",
        --- tailwindcss
        "tailwindcss-language-server",
        --- typescript
        "vtsls",
        "prettier",
        --- python
        "pyright",
        "ruff",
        -- yaml
        "yaml-language-server",
        -- shell
        "shfmt",
      })
    end,
  },
}
