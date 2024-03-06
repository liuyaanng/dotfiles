return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      -- load the colorshame
      vim.o.background = "light"
      vim.cmd([[colorscheme gruvbox]])
    end,
    opts = {
      undercurl = true,
      underline = true,
      bold = true,
      italic = {
        strings = true,
        comments = true,
        operators = true,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = false,
    },
  },
}
