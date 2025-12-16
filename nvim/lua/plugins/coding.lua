return {
  -- better increment and decrement
  {
    "monaqa/dial.nvim",
    keys = {
      {
        "<C-a>",
        function()
          return require("dial.map").inc_normal()
        end,
        expr = true,
        desc = "Increment",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_normal()
        end,
        expr = true,
        desc = "Decrement",
      },
      {
        "g<C-a>",
        function()
          return require("dial.map").inc_gnormal()
        end,
        expr = true,
        desc = "Increment (visual)",
      },
      {
        "g<C-x>",
        function()
          return require("dial.map").dec_gnormal()
        end,
        expr = true,
        desc = "Decrement (visual)",
      },
      {
        "<C-a>",
        function()
          return require("dial.map").inc_visual()
        end,
        expr = true,
        desc = "Increment",
        mode = "v",
      },
      {
        "<C-x>",
        function()
          return require("dial.map").dec_visual()
        end,
        expr = true,
        desc = "Decrement",
        mode = "v",
      },
    },
    opts = function()
      local augend = require("dial.augend")
      return {
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
          augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
          augend.constant.new({ elements = { "and", "or" } }),
          augend.constant.new({ elements = { "true", "false" } }),
          augend.constant.new({ elements = { "True", "False" } }),
        },
      }
    end,
    config = function(_, opts)
      require("dial.config").augends:register_group(opts)
    end,
  },
  -- better log
  {
    "Goose97/timber.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("timber").setup({
        -- Configuration here, or leave empty to use defaults
        log_templates = {
          default = {
            javascript = [[console.log("%log_marker LOG %log_target ON LINE %filename:%line_number", %log_target)]],
            typescript = [[console.log("%log_marker LOG %log_target ON LINE %filename:%line_number", %log_target)]],
            jsx = [[console.log("%log_marker LOG %log_target ON LINE %filename:%line_number", %log_target)]],
            tsx = [[console.log("%log_marker LOG %log_target ON LINE %filename:%line_number", %log_target)]],
          },
        },
        log_marker = "🚀 → ",
      })
    end,
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
