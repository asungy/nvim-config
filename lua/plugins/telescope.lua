return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").git_files()
      end,
      desc = "Find git files",
    },
    {
      "<leader>f/",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
       "<leader>fm",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "Marks",
   },
   {
       "<leader>fq",
      function()
        require("telescope.builtin").colorscheme()
      end,
      desc = "Colorschemes",
   },
   {
       "<leader>fr",
      function()
        require("telescope.builtin").registers()
      end,
      desc = "Registers",
   },
   {
       "<leader>fz",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find()
      end,
      desc = "Current buffer fuzzy find",

   },
   {
       "<leader>fgc",
      function()
        require("telescope.builtin").git_commits()
      end,
      desc = "Git commits",
   },
   {
       "<leader>fgb",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Git current buffer commits",
   },
   {
       "<leader>fgs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Git status",
   },
   {
       "<leader>fgh",
      function()
        require("telescope.builtin").git_stash()
      end,
      desc = "Git stash",
   },
   {
       "<leader>flr",
      function()
        require("telescope.builtin").lsp_references()
      end,
      desc = "References",
   },
   {
       "<leader>fli",
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      desc = "Implementations",
   },
   {
       "<leader>fld",
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      desc = "Definitions",
   },
   {
       "<leader>flt",
      function()
        require("telescope.builtin").lsp_type_definitions()
      end,
      desc = "Type Definitions",
   },
   {
       "<leader>flD",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Diagnostics",
   }
  },
}
