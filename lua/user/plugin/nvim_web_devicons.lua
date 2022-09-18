local ok, devicons = pcall(require, "nvim-web-devicons")
if not ok then
    print("Error: Could not find nvim-web-devicons (nvim_web_devicons.lua)")
    return
end
