-- Don't forget to run :PackerInstall

local overrides = require "custom.plugins.overrides"

return {

  -- Lsp Config
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- Null-ls config
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- Mason config
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- Treesitter config
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

  ["fatih/vim-go"] = {},
  ["windwp/nvim-ts-autotag"] = {},
  ["knubie/vim-kitty-navigator"] = {},
}
