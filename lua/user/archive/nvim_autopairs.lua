local ok, npairs = pcall(require, "nvim-autopairs")
if not ok then
    print("Error: Could not find nvim-autopairs (nvim_autopairs.lua)")
    return
end

npairs.setup {
    check_ts = true,
    disable_filetype = { "TelescopePrompt", "toggleterm", },
    enable_check_bracket_line = true,
    map_cr = false,
}
