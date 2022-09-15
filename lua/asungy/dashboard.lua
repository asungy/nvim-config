local ok, dashboard = pcall(require, "dashboard")
if not ok then
    print("Error: Could not find dashboard (dashboard.lua)")
    return
end


dashboard.custom_header = {
' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

dashboard.custom_center = {
    {
        icon = ' ',
        desc = 'Find files                     ',
        shortcut = 'Space f i',
        action = 'lua require \'telescope.builtin\'.find_files{hidden=true, no_ignore=true}',
    },
    {
        icon = ' ',
        desc = 'Open file explorer             ',
        shortcut = 'Ctrl n    ',
        action = 'NvimTreeOpen',
    },
    {
        icon = ' ',
        desc = 'Open terminal                  ',
        shortcut = 'Space t r',
        action = 'terminal'
    },
    {
        icon = ' ',
        desc = 'New tab                        ',
        shortcut = 'Space n t',
        action = 'tabnew',
    },
    {
        icon = ' ',
        desc = 'Search word                    ',
        shortcut = 'Space l g',
        action = 'Telescope live_grep',
    },
}
