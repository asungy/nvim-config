local ok, key_menu = pcall(require, "key-menu")
if not ok then
    print("Error: Could not find key-menu (key_menu.lua)")
    return
end

-- Make key-menu pop up after these characters
key_menu.set('n', '<leader>l', {desc='LSP Commands'})
