local autocmd = vim.api.nvim_create_autocmd
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--  command = "tabdo wincmd =",
-- })
vim.o.relativenumber = true

-- Copilot settings
vim.g.copilot_assume_mapped = true

-- Diagnostic settings
vim.diagnostic.config {
  float = {
    source = "always",
    border = "rounded",
  },
}
