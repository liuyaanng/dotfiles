return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    opts = function()
      return {
        model = "gpt-4",
        auto_insert_mode = true,
        show_help = false,
        question_header = "  Leon",
        answer_header = "  Copilot ",
        window = {
          layout = "horizontal",
          width = 1,
          height = 0.4,
          border = "rounded",
        },
        selection = function(source)
          local select = require("CopilotChat.select")
          return select.visual(source) or select.buffer(source)
        end,
      }
    end,
  },
}
