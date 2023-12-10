local status, notify = pcall(require, 'notify')
if not status then
  return
end

notify.setup({
  background_colour = "NotifyBackground",
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  stages = "fade_in_slide_out",
  fps = 60,
  render = "compact",
  timeout = 3000,
  top_down = true,
})

local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", ",;", function()
--   require('telescope').extensions.notify.notify({
--     layout_strategy = 'vertical',
--     layout_config = {
--       width = 0.9,
--       height = 0.9,
--       -- preview_height = 0.1,
--     },
--     wrap_results = true,
--     previewer = false,
--   })
-- end, opts);
vim.keymap.set("n", "<LEADER>c;", notify.dismiss, opts);
