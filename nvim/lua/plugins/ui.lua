return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "E",
        function()
          vim.api.nvim_command("w")
          vim.api.nvim_command("BufferLineCyclePrev")
        end,
        desc = "Prev buffer",
        mode = "n",
      },
      {
        "R",
        function()
          vim.api.nvim_command("w")
          vim.api.nvim_command("BufferLineCycleNext")
        end,
        desc = "Next buffer",
        mode = "n",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
