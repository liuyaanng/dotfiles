local M = {}

M = {
  { 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },

  -- LSP Support
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason.nvim',
    build = function()
      vim.cmd([[MasonInstall]])
    end,
  },
  { 'williamboman/mason-lspconfig.nvim' },


  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-calc",
      'saadparwaiz1/cmp_luasnip',
    }
  },


  -- LSP Apperance
  { 'onsails/lspkind-nvim' },

  -- trouble
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons' -- optional
    }
  }

  -- {
  --   'j-hui/fidget.nvim',
  --   tag = "legacy"
  -- },
  -- "folke/neodev.nvim",
  -- "ray-x/lsp_signature.nvim",
  -- "ldelossa/nvim-dap-projects",
  -- {
  --   "lvimuser/lsp-inlayhints.nvim",
  --   branch = "anticonceal",
  -- },
  -- "mjlbach/lsp_signature.nvim",
}

return M
