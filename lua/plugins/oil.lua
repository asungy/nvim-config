return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-lua/plenary.nvim" }, -- soft dependency; enables :Oil --preview floating preview
  keys = {
    { "<C-n>", function() require("oil").toggle_float() end, desc = "Toggle oil floating file explorer" },
  },
  opts = {
    default_file_explorer = true, -- o :edit a directory opens oil instead of netrw
    columns = { "icon" },         -- show icons per entry (add "size", "mtime", "permissions" as desired)
    keymaps = {
      ["<C-h>"] = false,          -- do not let oil take our window-left keymap in the buffer
      ["<C-l>"] = false,          -- same for window-right; oil uses it to open directories by default
      ["q"] = "actions.close",    -- close oil like a normal popup
      ["-"] = "actions.parent",   -- go up one directory
      ["_"] = "actions.open_cwd", -- jump back to working directory
    },
    view_options = {
      show_hidden = false, -- show dotfiles in the listing
      is_always_hidden = function(name) -- never show editor noise
        return name == ".DS_Store" or name == ".."
      end,
    },
    float = {
      border = "rounded",
      max_width = 90,
      max_height = 30,
    },
  },
}
