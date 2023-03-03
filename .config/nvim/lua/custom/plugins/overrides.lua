local M = {}

M.treesitter = {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "go",
  },
  autotag = {
    enable = true,
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
    "emmet-ls",
    -- Golang dev
    "gopls",
    "golangci-lint",
  },
}
return M
