-- First read our docs (completely) then check the example_config repo
local M = {}

local highlight = require "custom.highlights"

M.ui = {
  theme = "onedark",
  hl_override = highlight.override,
  hl_add = highlight.add,
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
