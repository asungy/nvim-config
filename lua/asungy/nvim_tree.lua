local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
    print("Error: Could not find nvim-tree (nvim_tree.lua)")
    return
end

nvim_tree.setup()
