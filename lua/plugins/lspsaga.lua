return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach", -- only load once an LSP server is actually attached
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- finder/peek render with treesitter
    "nvim-tree/nvim-web-devicons",     -- file icons in the finder window
  },
  keys = {
    -- Replaces the old vim.lsp.buf.* mappings from keymaps.lua
    { "<leader>ld", "<cmd>Lspsaga peek_definition<CR>",      desc = "Peek definition" },
    { "<leader>lr", "<cmd>Lspsaga finder ty=ref<CR>",        desc = "Find references" },
    { "<leader>lk", "<cmd>Lspsaga hover_doc<CR>",            desc = "Hover documentation" },
    { "<leader>la", "<cmd>Lspsaga code_action<CR>",          desc = "Code action", mode = { "n", "v" } },
    { "<leader>ln", "<cmd>Lspsaga rename<CR>",               desc = "Rename symbol" },
    { "<leader>le", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "Show diagnostics under cursor" },

    -- Bonus navigation
    { "<leader>l]", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic" },
    { "<leader>l[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Previous diagnostic" },
    { "<leader>lo", "<cmd>Lspsaga outline<CR>",              desc = "Symbol outline" },
  },
  opts = {
    definition = {
      keys = {
        edit  = "<C-c>o", -- jump into the definition (edit)
        vsplit = "<C-c>v",
        split = "<C-c>s",
        quit  = "q",
      },
    },
    finder = {
      keys = {
        -- jump between finder results and close the preview
        expand_or_jump = "o",
        quit = "q",
        close_in_preview = "<Esc>",
      },
    },
    hover = {
      open_link = "gx", -- open links in hover docs (default)
    },
    diagnostic = {
      jump = {
        wrap = true, -- wrap around at last/first diagnostic
      },
      max_height = 25,
      max_width = 80,
      border_follow = true,
      show_code_actions = true,
    },
    ui = {
      title = true,      -- put a title on float windows
      border = "rounded",
      code_action = "",  -- plain code_action window (no virtual text hint)
    },
  },
}
