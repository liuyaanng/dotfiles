return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      -- hidden no information available
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      -- hidden written information
      table.insert(opts.routes, {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      })

      -- show @recording message
      table.insert(opts.routes, {
        view = "notify",
        filter = { event = "msg_showmode" },
      })

      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },
  {
    "echasnovski/mini.animate",
    opts = {
      open = {
        enable = false,
      },
      close = {
        enable = false,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    keys = {
      {
        "E",
        function()
          vim.api.nvim_command("w")
          vim.api.nvim_command("BufferLineCyclePrev")
        end,
        desc = "Prev buffer",
        mode = "n",
      },
      {
        "R",
        function()
          vim.api.nvim_command("w")
          vim.api.nvim_command("BufferLineCycleNext")
        end,
        desc = "Next buffer",
        mode = "n",
      },
    },
  },
}
