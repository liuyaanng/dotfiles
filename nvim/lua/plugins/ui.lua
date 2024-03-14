return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- bufferline
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
}
