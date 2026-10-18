local group = vim.api.nvim_create_augroup("config_filetype_indent", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group   = group,
    pattern = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" },
    callback = function()
        vim.opt_local.shiftwidth  = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.tabstop     = 2
    end,
    desc = "Use 2-space indent for web filetypes",
})
