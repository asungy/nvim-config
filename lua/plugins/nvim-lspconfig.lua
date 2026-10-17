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
            "MunifTanjim/nui.nvim"
        },
        opts = { lsp = { auto_attach = true } },
        keys = {
          {
            "<C-s>",
            function()
              local client = vim.lsp.get_clients({ bufnr = 0 })[1]
              if client then
                require("nvim-navbuddy").attach(client)
              else
                vim.notify("NavBuddy: no LSP client attached in this buffer", vim.log.levels.WARN)
              end
            end,
            desc = "Open NavBuddy (LSP symbol navigation)",
          },
        },
      },
    },
    config = function()
      require("mason").setup()

      vim.lsp.config("lua_ls", {}); vim.lsp.enable("lua_ls")
      vim.lsp.config("ts_ls", {}); vim.lsp.enable("ts_ls")
    end,
  },
}
