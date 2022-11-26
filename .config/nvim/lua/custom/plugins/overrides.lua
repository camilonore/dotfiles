local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "go",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
    -- Web dev
    "prettierd",
    "eslint_d",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    -- Golang dev
    "gopls",
    "golangci-lint",
  },
}

return M
