return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function(_, _)
    local highlight = {
        "RainbowBlue1",
        "RainbowBlue2",
        "RainbowBlue3",
        "RainbowBlue4",
        "RainbowBlue5",
        "RainbowBlue6",
        "RainbowBlue7",
    }

    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook, so they are reset
    -- every time the colorscheme changes
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        -- Seven very dark shades of blue, cyan-leaning (light) to indigo-leaning (dark),
        -- in nesting order: level 1 nests first, level 7 is the deepest
        vim.api.nvim_set_hl(0, "RainbowBlue1", { fg = "#4890A8" }) -- dark steel cyan-blue
        vim.api.nvim_set_hl(0, "RainbowBlue2", { fg = "#4676AC" }) -- dark muted sky
        vim.api.nvim_set_hl(0, "RainbowBlue3", { fg = "#3E619A" }) -- dark muted azure
        vim.api.nvim_set_hl(0, "RainbowBlue4", { fg = "#35507C" }) -- deep royal blue
        vim.api.nvim_set_hl(0, "RainbowBlue5", { fg = "#3A4770" }) -- deep indigo
        vim.api.nvim_set_hl(0, "RainbowBlue6", { fg = "#4A5480" }) -- dark muted periwinkle
        vim.api.nvim_set_hl(0, "RainbowBlue7", { fg = "#5B7CA4" }) -- dark desaturated blue
    end)

    require("ibl").setup {
        indent = { 
            char = "·",
            highlight = highlight
        },
        scope = {
            enabled = false,
        },
    }
    end,
}

