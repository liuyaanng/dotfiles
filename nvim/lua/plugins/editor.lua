return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  -- {
  --   "norcalli/nvim-colorizer.lua",
  --   config = function()
  --     require("colorizer").setup({
  --       "*",
  --       css = { css = true },
  --     })
  --   end,
  -- },
  --
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = { "*" },
        user_default_options = {
          -- RGB = true, -- #RGB hex codes
          -- RRGGBB = true, -- #RRGGBB hex codes
          -- names = true, -- "Name" codes like Blue or blue
          -- RRGGBBAA = false, -- #RRGGBBAA hex codes
          -- AARRGGBB = false, -- 0xAARRGGBB hex codes
          -- rgb_fn = false, -- CSS rgb() and rgba() functions
          -- hsl_fn = false, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          -- css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          -- Available modes for `mode`: foreground, background,  virtualtext
          mode = "background", -- Set the display mode.
          -- Available methods are false / true / "normal" / "lsp" / "both"
          -- True is same as normal
          tailwind = false, -- Enable tailwind colors
          -- parsers can contain values used in |user_default_options|
          sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
          virtualtext = "■",
          -- update color values even if buffer is not focused
          -- example use: cmp_menu, cmp_docs
          always_update = false,
        },
        -- all the sub-options of filetypes apply to buftypes
        buftypes = {},
      })
    end,
  },
  {
    -- npm install -g live-server
    -- LiveServerInstall
    "aurum77/live-server.nvim",
    config = function()
      require("live_server").setup({
        port = 8080,
        browser_command = "min", -- Empty string starts up with default browser
        quiet = false,
        no_css_inject = false, -- Disables css injection if true, might be useful when testing out tailwindcss
        install_path = vim.fn.stdpath("config") .. "/live-server/",
      })
    end,
    keys = {
      {
        "<leader>ls",
        "<cmd>LiveServer<cr>",
        desc = "live server toggle",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      icons = {
        misc = {
          dots = "󰇘",
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = " ",
          BreakpointCondition = " ",
          BreakpointRejected = { " ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = " ",
          Warn = " ",
          Hint = " ",
          Info = " ",
        },
        git = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        kinds = {
          Array = " ",
          Boolean = "󰨙 ",
          Class = " ",
          Codeium = "󰘦 ",
          Color = " ",
          Control = " ",
          Collapsed = " ",
          Constant = "󰏿 ",
          Constructor = " ",
          Copilot = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Folder = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Keyword = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          Reference = " ",
          Snippet = "󰐝 ",
          String = " ",
          Struct = "󰆼 ",
          TabNine = "󰏚 ",
          Text = "󰉿 ",
          TypeParameter = " ",
          Unit = " ",
          Value = " ",
          Variable = "󰀫 ",
        },
      },
    },
    keys = {
      { "<leader>lz", "<cmd>Lazy<cr>", desc = "lazy" },
    },
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
}
