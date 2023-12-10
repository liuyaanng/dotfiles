local status_lspzero, lsp_zero = pcall(require, 'lsp-zero')
local status_mason, mason = pcall(require, 'mason')
local status_maosn_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_lspconfig, lspconfig = pcall(require, 'lspconfig')
local status_cmp, cmp = pcall(require, 'cmp_nvim_lsp')
local status_lspsaga, lspsaga = pcall(require, 'lspsaga')
local status_whichkey, whichkey = pcall(require, 'which-key')

if (not status_lspzero) then return end
if (not status_mason) then return end
if (not status_maosn_lspconfig) then return end
if (not status_lspconfig) then return end
if (not status_cmp) then return end
if (not status_lspsaga) then return end
if (not status_whichkey) then return end

lsp_zero.on_attach(function(client, bufnr) -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- Global keymapping
  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', opts)
  vim.keymap.set('n', 'gt', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
  vim.keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

  -- code action
  vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
end)

lsp_zero.set_sign_icons({
  error = "",
  -- error = "",
  warn = "",
  hint = "",
  information = "",
  other = "",
})

-- set up completion using nvim_cmp with LSP source
local capabilities = cmp.default_capabilities()

-- format on save
lsp_zero.format_on_save({
  format_opts = {
    async = false,
    -- timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['tsserver'] = { 'javascript', 'typescript' },
    ['pyright'] = { 'python' }
  }
})
-- lspsaga
lspsaga.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    colors = {
      normal_bg = '#002b36'
    }
  },
  symbol_in_winbar = {
    enable = false
  }
})


-- mason config
mason.setup({})

-- mason lspconfig
mason_lspconfig.setup({
  ensure_installed = { 'lua_ls', 'tsserver', 'pyright' },
  handlers = {
    lsp_zero.default_setup,
    -- lua
    lua_ls = function()
      lspconfig.lua_ls.setup({
        single_file_support = false,
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { 'vim' },
            },
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false
            },
          },
        },
      })
    end,
    -- typescript
    tsserver = function()
      lspconfig.tsserver.setup({
        filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
        cmd = { "typescript-language-server", "--stdio" },
      })
    end,
    -- python
    pyright = function()
      lspconfig.pyright.setup {}
    end
  },
})


whichkey.register({
  ["<leander>r"] = {
    name = "+rename",
    n = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Reanme" }
  }
})
