local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end
local fb_actions = require "telescope._extensions.file_browser.actions"

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ['q'] = actions.close
      },
      i = {
        ["<C-h>"] = "which_key",
        ["<C-k>"] = "move_selection_previous",
        ["<C-j>"] = "move_selection_next",
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-e>"] = "preview_scrolling_down",
        ["<esc>"] = "close",
      }
    },
  },
  color_devicons = true,
  prompt_prefix = "🔍 ",
  selection_caret = " ",
  path_display = { "truncate" },
  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  pickers = {
    find_files = {
      -- theme = "dropdown",
    },
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      }
    },
  },

  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
          ["<C-u>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_previous(prompt_bufnr) end
          end,
          ["<C-d>"] = function(prompt_bufnr)
            for i = 1, 10 do actions.move_selection_next(prompt_bufnr) end
          end,
          ["<PageUp>"] = actions.preview_scrolling_up,
          ["<PageDown>"] = actions.preview_scrolling_down,
        },
      },
    }
  }
}
telescope.load_extension('fzf')
telescope.load_extension("file_browser")

local function save_and_find_files()
  vim.api.nvim_command('w')
  builtin.find_files()
end

local function save_and_live_grep()
  vim.api.nvim_command('w')
  builtin.live_grep()
end

local function save_and_buffers()
  vim.api.nvim_command('w')
  builtin.buffers()
end

local function save_and_diagnostics()
  vim.api.nvim_command('w')
  builtin.diagnostics()
end

-- -- keymaps

local m = { noremap = true, nowait = true }
vim.keymap.set('n', '<leader>ff', save_and_find_files, {})
vim.keymap.set('n', '<leader>lg', save_and_live_grep, {})
vim.keymap.set('n', '\\\\', save_and_buffers, {})
vim.keymap.set('n', '<leader>e', save_and_diagnostics, {})

vim.keymap.set('n', '<leader>fb', function()
  vim.api.nvim_command('w')
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

vim.keymap.set('n', '<leader>rs', builtin.resume, m)
vim.keymap.set('n', '<c-h>', builtin.oldfiles, m)
vim.keymap.set('n', '<c-_>', builtin.current_buffer_fuzzy_find, m)
vim.keymap.set('n', 'z=', builtin.spell_suggest, m)
vim.keymap.set('n', '<leader>d', builtin.diagnostics, m)
vim.keymap.set('n', 'gi', builtin.git_status, m)
vim.keymap.set("n", ":", builtin.commands, m)
