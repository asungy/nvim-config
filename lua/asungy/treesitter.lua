local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Error: Could not find nvim-treesitter.configs")
    return
end

ts_configs.setup {
    -- A list of parser names, or "all"
    ensure_installed = "all",
    -- Install parsers synchronously
    sync_install = false,
    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- List of languages that will be disabled
        disable = {},
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
