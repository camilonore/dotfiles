---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz", "Go half bottom screen and center" },
    ["<C-u>"] = { "<C-u>zz", "Go half top screen and center" },
  },
}
M.comment = {
  -- toggle comment in both modes
  n = {
    ["<leader>}"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>}"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}


return M
