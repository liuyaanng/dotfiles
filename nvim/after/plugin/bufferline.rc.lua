local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end


bufferline.setup({
  options = {
    mode = 'buffers',
    separator_style = 'slant',
    style_preset = bufferline.style_preset.default,
    themable = true,
    always_show_bufferline = false,
    color_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    enforce_regular_tabs = true,
    show_duplicate_prefix = false,
    tab_size = 16,
    padding = 0,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      -- style = 'icon' | 'underline' | 'none',
      style = "icon",
    },
    close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = true
      }
    },
  },
})

local function close_current_buffer()
  require('bufdelete').bufdelete(vim.fn.bufnr('%'), true)
end


vim.keymap.set('n', 'R', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'E', '<Cmd>BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', '<leader>bc', close_current_buffer, {})
