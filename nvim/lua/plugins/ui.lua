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
      { "E", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer", mode = "n" },
      { "R", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer", mode = "n" },
    },
  },
}
