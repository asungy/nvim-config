local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
    print("Error: Could not find toggleterm")
    return
end

toggleterm.setup {
    size = 20,
    open_mapping = [[<A-\>]],
    direction = "float",
    shade_terminals = true,
    shading_factor = 1,
    close_on_exit = true,
    float_opts = {
        border = "curved",
        winblend = 3,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
}
