-- FZF sorter for Telescope
-- Requires: gcc/clang and make
return {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = false,
    build = "make",
    dependencies = {"nvim-telescope/telescope.nvim"},
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
