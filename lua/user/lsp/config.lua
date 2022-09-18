local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
    print("Error: Could not find lspconfig")
    return
end

-- Diagnostic mappings
local leader2 = "-" -- pseudo-leader key for LSP
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
keymap("n", leader2 .. "-e", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", leader2 .. "q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys after the language
-- server attaches to the current buffer.
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <C-x><C-o>
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- Jump to declaration
    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    -- Jump to definition
    keymap("n", "gd", vim.lsp.buf.definition, bufopts)
    -- Display hover info under cursor
    keymap("n", "K", vim.lsp.buf.hover, bufopts)
    -- List all implementations of symbol under cursor
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
    -- Display signature information under cursor
    keymap("n", leader2 .. "k", vim.lsp.buf.signature_help, bufopts)
    -- Add workspace folder
    keymap("n", leader2 .. "wa", vim.lsp.buf.add_workspace_folder, bufopts)
    -- Remove workspace folder
    keymap("n", leader2 .. "wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    -- List all workspace folders
    keymap("n", leader2 .. "wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    -- Jump to definition of type
    keymap("n", leader2 .. "D", vim.lsp.buf.type_definition, bufopts)
    -- Rename symbol
    keymap("n", leader2 .. "rn", vim.lsp.buf.rename, bufopts)
    -- Select code action under cursor
    keymap("n", leader2 .. "ca", vim.lsp.buf.code_action, bufopts)
    -- Show references
    keymap("n", "gr", vim.lsp.buf.references, bufopts)
    -- Formatting
    keymap("n", leader2 .. "f", vim.lsp.buf.formatting, bufopts)
end

local servers = {
    "ccls",          -- C++
    "dockerls",      -- Docker
    "gopls",         -- Golang
    "jsonls",        -- JSON
    "marksman",      -- Markdown
    "pyright",       -- Python
    "rust_analyzer", -- Rust
    "sumneko_lua",   -- Lua
    "tsserver",      -- JavaScript/TypeScript
}

-- Use a loop to conveniently call 'setup' on multiple servers and map buffer
-- local keybindings when the language server attaches.
for _, lsp in pairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        flags = {
            -- This will be default in neovim 0.7+
            debounce_text_changes = 150,
        }
    }
end
