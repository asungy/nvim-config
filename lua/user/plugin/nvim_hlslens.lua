local ok, hlslens = pcall(require, "hlslens")
if not ok then
    print("Error: Could not find nvim-hlslens (nvim_hlslens.lua)")
    return
end

hlslens.setup({
    calm_down = {
        description = [[If calm_down is true, clear all lens and highlighting When the cursor is
            out of the position range of the matched instance or any texts are changed]],
        default = true,
    }
})
