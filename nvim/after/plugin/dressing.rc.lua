local status, dressing = pcall(require, 'dressing')
if not status then
  return
end

dressing.setup({
  select = {
    get_config = function(opts)
      if opts.kind == 'codeaction' then
        return {
          backend = 'telescope',
          telescope = require('telescope.themes').get_cursor()
        }
      end
    end
  }
})
