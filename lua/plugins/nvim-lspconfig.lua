return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    config = function()
      require("mason").setup()

      vim.lsp.config("lua_ls", {})
      vim.lsp.enable("lua_ls")
      vim.lsp.config("ts_ls", {})
      vim.lsp.enable("ts_ls")
    end,
  },
}
