-- Maintained successor to numToStr/Comment.nvim (which is archived and
-- incompatible with Neovim 0.12's treesitter get_parser changes).
-- Uses Neovim's built-in comment operators (gcc, gc{motion}, gb) under the hood.
return {
  "folke/ts-comments.nvim",
  opts = {},
}
