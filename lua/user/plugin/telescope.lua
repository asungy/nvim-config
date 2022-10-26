local ok, telescope = pcall(require, "telescope")
if not ok then
    print("Error: Could not find telescope (telescope.lua)")
    return
end

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- options: "ignore_case", "respect_case", "smart_case"
        }
    },
    pickers = {
        buffers = {
            show_all_buffers = true,
            sort_lastused = true,
            mappings = {
                i = {
                    ["<C-d>"] = "delete_buffer",
                }
            },
        }
    }
}
telescope.load_extension("fzf")
