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
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
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
  },
}
