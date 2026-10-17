return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()

      vim.lsp.config("lua_ls", {}); vim.lsp.enable("lua_ls")
    end,
  },
}
