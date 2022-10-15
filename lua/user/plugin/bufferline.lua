local ok, bufferline = pcall(require, "bufferline")
if not ok then
    print("Error: Could not find bufferline (bufferline.lua)")
    return
end

bufferline.setup{
    options = {
        mode = "buffers",
        -- Shift over tabs when opening NvimTree
        offsets = {
            {
                filetype = "NvimTree",
                text_align = "left",
                separator = true,
            },
        },
        numbers = "buffer_id",
        modified_icon = '',
        sort_by = 'tabs',
    },
}
