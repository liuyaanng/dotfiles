return {
  -- better increment and decrement
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },
  -- better log
  {
    "gaelph/logsitter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("logsitter").setup({
        path_format = "default",
        prefix = "🚀 👉",
        separator = "👉",
      })
    end,
    keys = {
      {
        "<leader>lg",
        function()
          require("logsitter").log()
        end,
        desc = "Logsitter",
      },
      {
        "<leader>lv",
        function()
          require("logsitter").log_visual()
        end,
        desc = "Logsitter",
      },
    },
  },
  {
    "saghen/blink.cmp",
    enabled = true,
    opts = {
      completion = {
        menu = {
          winblend = vim.o.pumblend,
        },

        ghost_text = {
          enabled = true,
        },

        -- auto show document
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
      },

      signature = {
        enabled = true,
        window = {
          winblend = vim.o.pumblend,
        },
      },

      keymap = {
        preset = "default",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        -- super tab
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          "snippet_forward",
          "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
      },
    },
  },
}
