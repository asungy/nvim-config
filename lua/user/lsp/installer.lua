local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    print("Could not find nvim-lsp-installer")
    return
end

lsp_installer.setup({
    -- Setting this to false because this doesn't work well for all servers. If
    -- you want to install specific servers use `:LspInstall <name of server>`
    automatic_installation = false,
    ui = {
        -- Whether to automatically check for outdated servers when opening the UI window.
        check_outdated_servers_on_open = true,

        -- The border to use for the UI window. Accepts the same border values
        -- as |nvim_open_win()|
        border = "rounded",

        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },

        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",
            -- Keymap to install the server under the current cursor position
            install_server = "i",
            -- Keymap to reinstall/update the server under the current cursor position
            update_server = "u",
            -- Keymap to check for new version for the server under the current cursor position
            check_server_version = "c",
            -- Keymap to update all installed servers
            update_all_servers = "U",
            -- Keymap to check which installed servers are outdated
            check_outdated_servers = "C",
            -- Keymap to uninstall a server
            uninstall_server = "X",
        },

    },

    -- The directory in which to install all servers.
    install_root_dir = vim.fn.stdpath("data") .. "/lsp_servers",

    -- Controls to which degree logs are written to the log file. It's useful
    -- to set this to vim.log.levels.DEBUG when debugging issues with server
    -- installations.
    log_level = vim.log.levels.INFO,

    -- Limit for the maximum amount of servers to be installed at the same
    -- time. Once this limit is reached, any further servers that are requested
    -- to be installed will be put in a queue.
    max_concurrent_installers = 4,

    -- The template URL to use when downloading assets from GitHub.
    github = {
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
})
