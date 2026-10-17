return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- attach when a real file buffer opens; avoids overhead in empty buffers
  opts = {
    signs = {
      add          = { text = "+" },
      change       = { text = "~" },
      delete       = { text = "_" },
      topdelete    = { text = "‾" },
      changedelete = { text = "~" },
      untracked    = { text = "┆" },
    },
    signcolumn = true,   -- toggle the sign column when signs appear/disappear
    numhl = false,       -- don't color the line number of changed lines
    linehl = false,      -- don't highlight the whole line of changed lines
    word_diff = false,   -- inline word diff on changed lines
    watch_gitdir = {
      interval = 1000,   -- poll the git dir every second for external changes (commit/stash)
      follow_files = true,
    },
    current_line_blame = false, -- set true to always show `author, date` blame at EOL
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",    -- or "right_align", "overlay"
      delay = 200,              -- ms after cursor stops moving before blame shows
    },
  },
  keys = {
    -- Navigate hunks
    { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next git hunk" },
    { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous git hunk" },

    -- Hunks
    { "<leader>sp", function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" },
    { "<leader>ss", function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" },
    { "<leader>sr", function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },

    -- Line blame on demand (since current_line_blame is off)
    { "<leader>sb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle git blame" },

    -- Diff view of everything against index
    { "<leader>sd", function() require("gitsigns").diffthis() end, desc = "Git diff buffer vs index" },
  },
}
