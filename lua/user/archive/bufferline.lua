local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print("Error: Could not find bufferline (bufferline.lua)")
    return
end

bufferline.setup{
    options = {
        mode = "tabs",
        -- Shift over tabs when opening NvimTree
        offsets = {
            {
                filetype = "NvimTree",
                text_align = "left",
                separator = true,
            },
        },
    },
}
