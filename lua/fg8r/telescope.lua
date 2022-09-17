local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.load_extension('dap')

local actions = require("telescope.actions")

telescope.setup({
  defaults = {

    mappings = {
      i = {
        ["<leader>q"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<leader>Q"] = actions.send_to_qflist + actions.open_qflist
      },
      n = {
        ["<leader>q"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<leader>Q"] = actions.send_to_qflist + actions.open_qflist
      }
    },
    -- prompt_prefix = "",
    -- selection_caret = "",
    -- path_display = { "smart" },

  },
  pickers = {
    find_files = {
      theme = "dropdown"
    },
    grep_string = {
      theme = "ivy"
    },
    live_grep = {
      theme = "ivy"
    },
    buffers = {
      theme = "dropdown"
    },
    current_buffer_fuzzy_find = {
      theme = "ivy"
    }
  },
  extensions = {
    media_files = {}
  },
})
