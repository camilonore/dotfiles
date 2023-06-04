-- Mason -> Install Linters & Formatters

local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {
    -- webdev stuff
  b.formatting.prettierd,
  b.formatting.eslint_d,

  -- Lua
  b.formatting.stylua,

  -- Golang
  b.diagnostics.golangci_lint,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- Format on Save
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
}
