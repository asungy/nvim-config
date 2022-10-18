local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not ok then
    print("Error: Could not find mason-lspconfig (mason-lspconfig.lua)")
    return
end

mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
})
