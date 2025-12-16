return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = "CopilotChat",
    keys = {
      { "<leader>ccc", "<cmd>CopilotChat<cr>", desc = "Copilot Chat" },
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "Copilot Chat Explain" },
      { "<leader>ccr", "<cmd>CopilotChatReview<cr>", desc = "Copilot Chat Review" },
      { "<leader>ccf", "<cmd>CopilotChatFix<cr>", desc = "Copilot Chat Fix" },
      { "<leader>cco", "<cmd>CopilotChatOptimize<cr>", desc = "Copilot Chat Optimize" },
    },
    opts = {
      model = "gpt-4",
      auto_insert_mode = true,
      show_help = false,
      question_header = "  Leon",
      answer_header = "  Copilot ",
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
    },
  },
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>a", nil, desc = "AI/Claude Code" },
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
      { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
      {
        "<leader>as",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
