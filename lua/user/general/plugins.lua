-- Autocommand that reloads neovim whenever keymaps.lua is written to
vim.cmd([[
    if !exists("plugins_autocmd_loaded")
        let plugins_autocmd_loaded = 1
        autocmd BufWritePost plugins.lua source <afile> | Lazy sync
    endif
]])

-- Automatically bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local ok, lazy = pcall(require, "lazy")
if not ok then
    print("Cannot find lazy. Try restarting.")
    return
end

lazy.setup({
    { -- Color scheme
        "navarasu/onedark.nvim",
        lazy = true,
    },
    { -- Color scheme
        "sainnhe/gruvbox-material",
        lazy = true,
    },
    { -- Color scheme
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    { -- Lua implementation of Popup API
        "nvim-lua/popup.nvim",
        lazy = false,
    },
    { -- Quickstart configs for NeoVim LSP
        "neovim/nvim-lspconfig",
        lazy = false,
    },
    { -- Manager for LSP servers
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({})
        end,
    },
    { -- Extension for Mason to easily integrate lspconfig
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {"neovim/nvim-lspconfig"},
        config = function()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup()
            mason_lspconfig.setup_handlers({
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,
            })
        end,
    },
    { -- Fuzzy finder
        "nvim-telescope/telescope.nvim",
        lazy = false,
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("telescope").setup {
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- options: "ignore_case", "respect_case", "smart_case"
                    }
                },
                pickers = {
                    buffers = {
                        show_all_buffers = true,
                        sort_lastused = true,
                        mappings = {
                            i = {
                                ["<C-d>"] = "delete_buffer",
                            }
                        },
                    }
                }
            }
        end,
    },
    { -- FZF sorter for Telescope
      -- Requires: gcc/clang and make
        "nvim-telescope/telescope-fzf-native.nvim",
        lazy = false,
        build = "make",
        dependencies = {"nvim-telescope/telescope.nvim"},
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    { -- Interface with treesitter
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        config = function()
            require("nvim-treesitter.configs").setup {
                -- A list of parser names, or "all"
                ensure_installed = "all",
                -- Install parsers synchronously
                sync_install = false,
                -- List of parsers to ignore installing (for "all")
                ignore_install = {},

                autopairs = {
                    enable = true,
                },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,
                    -- List of languages that will be disabled
                    disable = {},
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
    },
    { -- Floating terminal window
        "akinsho/toggleterm.nvim",
        lazy = false,
        config = function()
            require("toggleterm").setup {
                size = 20,
                open_mapping = [[<A-\>]],
                direction = "float",
                shade_terminals = true,
                shading_factor = 1,
                close_on_exit = true,
                float_opts = {
                    border = "curved",
                    winblend = 3,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            }
        end,
    },
    { -- Fancy bufferlines
        "akinsho/bufferline.nvim",
        version = "v2.*",
        lazy = false,
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("bufferline").setup{
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
        end,
    },
    { -- Fancy statuslines
        'nvim-lualine/lualine.nvim',
        lazy = false,
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = true,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            icons_enabled = true,
                            icon = '',
                            padding = 2,
                        }
                    },
                    lualine_b = {
                        {
                            'branch',
                            icons_enabled = true,
                            icon = '',
                            padding = 2,
                        },
                        'diff',
                        'diagnostics',
                    },
                    lualine_c = {
                        {
                            'filename',
                            file_status = true,
                            path = 3, -- 3: absolute path
                            symbols = {
                                modified = '',
                                readonly = '',
                                unnamed  = '',
                                newfile  = '',
                            },
                            padding = 2,
                        }
                    },
                    lualine_x = {
                        {
                            'encoding',
                            icons_enabled = true,
                            icon = '',
                            padding = 2,
                        },
                        {
                            'fileformat',
                            padding = 2,
                        },
                        {
                            'filetype',
                            padding = 4,
                        },
                    },
                    lualine_y = {
                        {
                            'progress',
                            icons_enabled = true,
                            icon = '',
                            padding = 4,
                        },
                    },
                    lualine_z = {
                        {
                            'location',
                            icons_enabled = true,
                            icon = '',
                            padding = 3,
                        }
                    },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {"nvim-tree", "toggleterm"},
            }
        end,
    },
    { -- Completion plugin
        "hrsh7th/nvim-cmp",
        lazy = false,
        dependencies = {
            -- source for buffer words
            "hrsh7th/cmp-buffer",
            -- source for cmdline
            "hrsh7th/cmp-cmdline",
            -- source for LSP client
            "hrsh7th/cmp-nvim-lsp",
            -- source for paths
            "hrsh7th/cmp-path",
            -- source for luasnip
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            local has_words_before = function()
              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
              return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            -- Set up completions
            cmp.setup({
                -- Specify snippet engine
                snippet = {
                    expand = function(args)
                        -- Use luasnip as snippet engine
                        luasnip.lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- Key mappings for completion
                mapping = {
                    -- Scroll up on docs
                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                    -- Scroll down on docs
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                    -- Open completion
                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    -- Quit completion
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- Select with Enter key
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    -- Super (forward) tab
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                -- When to enable completion
                enabled = function()
                    -- Disable for prompts
                    buftype = vim.api.nvim_buf_get_option(0, "buftype")
                    if buftype == "prompt" then
                        return false
                    end

                    local context = require('cmp.config.context')
                    -- keep command mode completion enabled
                    if vim.api.nvim_get_mode().mode == "c" then
                        return true
                    else
                        -- disable completion if in comments
                        return not context.in_treesitter_capture("comment")
                            and not context.in_syntax_group("Comment")
                    end
                end,
                sources = cmp.config.sources({
                    { name = "nvim_lsp"},
                    { name = "luasnip" },
                    { name = "buffer" },
                    { name = "path" },
                }),
                formatting = {
                    fields = { 'abbr', 'kind', 'menu' },
                    format = function(entry, vim_item)
                        -- The order of this table has to match the order of the 'sources'
                        vim_item.menu = ({
                            nvim_lsp = "",
                            luasnip = "",
                            buffer = "",
                            path = "",
                        })[entry.source.name]
                        return vim_item
                    end,
                },
                experimental = {
                    ghost_text = false,
                },
            })

            -- Use buffer source for '/' (won't work with 'native_menu')
            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {{ name = 'buffer' }}
            })

            -- Use cmdline and path source for ':' (won't work with 'native_menu')
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                    { name = 'cmdline' },
                })
            })
        end,
    },
    { -- Snippet engine
        "L3MON4D3/LuaSnip",
        lazy = false,
        dependencies = {
            -- preconfigured snippets for different languages
            "rafamadriz/friendly-snippets",
        },
        config = function()
            -- Use VS-Code style snippets (from "rafamadriz/friendly-snippets")
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    { -- File explorer
        "kyazdani42/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup({
             -- BEGIN_DEFAULT_OPTS
                  auto_reload_on_write = true,
                  create_in_closed_folder = false,
                  disable_netrw = false,
                  hijack_cursor = false,
                  hijack_netrw = true,
                  hijack_unnamed_buffer_when_opening = false,
                  ignore_buffer_on_setup = false,
                  open_on_setup = false,
                  open_on_setup_file = false,
                  open_on_tab = false,
                  ignore_buf_on_tab_change = {},
                  sort_by = "name",
                  root_dirs = {},
                  prefer_startup_root = true,
                  sync_root_with_cwd = true,
                  reload_on_bufenter = false,
                  respect_buf_cwd = false,
                  on_attach = "disable", -- function(bufnr). If nil, will use the deprecated mapping strategy
                  remove_keymaps = false, -- boolean (disable totally or not) or list of key (lhs)
                  view = {
                    adaptive_size = false,
                    centralize_selection = false,
                    width = 30,
                    hide_root_folder = false,
                    side = "left",
                    preserve_window_proportions = false,
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                    -- @deprecated
                    mappings = {
                      custom_only = false,
                      list = {
                        -- user mappings go here
                        -- { key = "v", action = "vsplit" }
                      },
                    },
                    float = {
                      enable = false,
                      open_win_config = {
                        relative = "editor",
                        border = "rounded",
                        width = 30,
                        height = 30,
                        row = 1,
                        col = 1,
                      },
                    },
                  },
                  renderer = {
                    add_trailing = false,
                    group_empty = false,
                    highlight_git = false,
                    full_name = false,
                    highlight_opened_files = "none",
                    root_folder_modifier = ":~",
                    indent_markers = {
                      enable = false,
                      inline_arrows = true,
                      icons = {
                        corner = "└",
                        edge = "│",
                        item = "│",
                        none = " ",
                      },
                    },
                    icons = {
                      webdev_colors = true,
                      git_placement = "before",
                      padding = " ",
                      symlink_arrow = " ➛ ",
                      show = {
                        file = true,
                        folder = true,
                        folder_arrow = true,
                        git = true,
                      },
                      glyphs = {
                        default = "",
                        symlink = "",
                        bookmark = "",
                        folder = {
                          arrow_closed = "",
                          arrow_open = "",
                          default = "",
                          open = "",
                          empty = "",
                          empty_open = "",
                          symlink = "",
                          symlink_open = "",
                        },
                        git = {
                          unstaged = "✗",
                          staged = "✓",
                          unmerged = "",
                          renamed = "➜",
                          untracked = "★",
                          deleted = "",
                          ignored = "◌",
                        },
                      },
                    },
                    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
                    symlink_destination = true,
                  },
                  hijack_directories = {
                    enable = true,
                    auto_open = true,
                  },
                  update_focused_file = {
                    enable = false,
                    update_root = false,
                    ignore_list = {},
                  },
                  ignore_ft_on_setup = {},
                  system_open = {
                    cmd = "",
                    args = {},
                  },
                  diagnostics = {
                    enable = false,
                    show_on_dirs = false,
                    debounce_delay = 50,
                    icons = {
                      hint = "",
                      info = "",
                      warning = "",
                      error = "",
                    },
                  },
                  filters = {
                    dotfiles = false,
                    custom = {},
                    exclude = {},
                  },
                  filesystem_watchers = {
                    enable = true,
                    debounce_delay = 50,
                  },
                  git = {
                    enable = false,
                    ignore = true,
                    show_on_dirs = true,
                    timeout = 400,
                  },
                  actions = {
                    use_system_clipboard = true,
                    change_dir = {
                      enable = true,
                      global = false,
                      restrict_above_cwd = false,
                    },
                    expand_all = {
                      max_folder_discovery = 300,
                      exclude = {},
                    },
                    file_popup = {
                      open_win_config = {
                        col = 1,
                        row = 1,
                        relative = "cursor",
                        border = "shadow",
                        style = "minimal",
                      },
                    },
                    open_file = {
                      quit_on_open = false,
                      resize_window = true,
                      window_picker = {
                        enable = true,
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                          buftype = { "nofile", "terminal", "help" },
                        },
                      },
                    },
                    remove_file = {
                      close_window = true,
                    },
                  },
                  trash = {
                    cmd = "gio trash",
                    require_confirm = true,
                  },
                  live_filter = {
                    prefix = "[FILTER]: ",
                    always_show_folders = true,
                  },
                  log = {
                    enable = false,
                    truncate = false,
                    types = {
                      all = false,
                      config = false,
                      copy_paste = false,
                      dev = false,
                      diagnostics = false,
                      git = false,
                      profile = false,
                      watcher = false,
                    },
                  },

            })
        end,
    },
    { -- Easily wrap text in character pairs (e.g. {}, (), [])
        "kylechui/nvim-surround",
        lazy = false,
        config = function()
            require("nvim-surround").setup{}
        end,
    },
    { -- Quick commenting/uncommenting
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup{}
        end,
    },
    { -- Git wrapper
        "lewis6991/gitsigns.nvim",
        lazy = false,
        config = function()
            require("gitsigns").setup({
                signs = {
                    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
                    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
                    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
                },
                signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir = {
                    interval = 1000,
                    follow_files = true
                },
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false,
                },
                sign_priority = 6,
                update_debounce = 100,
                status_formatter = nil, -- Use default
                max_file_length = 40000, -- Disable if file is longer than this (in lines)
                preview_config = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm = {
                    enable = false
                },
            })
        end
    },
    { -- Smooth scrolling
        "psliwka/vim-smoothie",
        lazy = false,
    },
    { -- Maximize/un-maximize window
        "szw/vim-maximizer",
        lazy = false,
    },
    { -- Markdown preview
        "iamcco/markdown-preview.nvim",
        lazy = false,
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    { -- Motion jumping plugin
        "phaazon/hop.nvim",
        lazy = false,
        config = function()
            require('hop').setup{}
        end,
    },
    { -- Notification floats
        "rcarriga/nvim-notify",
        lazy = false,
        config = function()
            require('notify').setup{}
        end,
    },
    { -- Vertical lines for indents
        "lukas-reineke/indent-blankline.nvim",
        lazy = false,
        config = function()
            require('indent_blankline').setup{}
            vim.g.indent_blankline_show_trailing_blankline_indent = false
        end,
    },
    { -- Keymaps hints
        "linty-org/key-menu.nvim",
        lazy = false,
        config = function()
            -- Make key-menu pop up after these characters
            require("key-menu").set('n', '<leader>l', {desc='LSP Commands'})
        end,
    },
    { -- Scroll bar
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
            require("scrollbar.handlers.search").setup()
        end,
        dependencies = {"kevinhwang91/nvim-hlslens"},
    },
    { -- Better highlight search
        "kevinhwang91/nvim-hlslens",
        lazy = false,
        config = function()
            require("hlslens").setup({
                calm_down = {
                    description = [[If calm_down is true, clear all lens and highlighting When the cursor is
                        out of the position range of the matched instance or any texts are changed]],
                    default = true,
                }
            })
        end,
    },
    { -- Auto pairs
      -- Note: previously had issues with windwp/nvim-autopairs
        "jiangmiao/auto-pairs",
        lazy = false,
    },
    { -- Interactive REPL
        "hkupty/iron.nvim",
        lazy = true,
        config = function()
            require("iron.core").setup({
                config = {
                    -- Highlights the last sent block with bold
                    highlight_last = "IronLastSent",
                    -- Toggling behavior is on by default.
                    -- Other options are: `single` and `focus`
                    visibility = require("iron.visibility").toggle,
                    -- Whether the repl buffer is a "throwaway" buffer or not
                    scratch_repl = true,
                    -- Automatically closes the repl window on process end
                    close_window_on_exit = true,
                    repl_definition = {
                     -- forcing a default
                      python = require("iron.fts.python").ipython,
                    },
                    -- Repl position. Check `iron.view` for more options,
                    -- currently there are four positions: left, right, bottom, top,
                    -- the param is the width/height of the float window
                    repl_open_cmd = require("iron.view").right(function()
                        return vim.o.columns / 2
                    end),
                    -- If the repl buffer is listed
                    buflisted = true,
                },
                keymaps = {
                    send_motion = "<leader>sc",
                    visual_send = "<leader>sc",
                    send_file = "<leader>sf",
                    send_line = "<leader>sl",
                    cr = "<leader>s<cr>",
                    interrupt = "<leader>s<leader>",
                    exit = "<leader>sq",
                    clear = "<leader>cl",
                },
                highlight = {
                    italic = true,
                },
                ignore_blank_lines = true,
            })
        end,
    },
})
