local opt = vim.opt

-- Appearance
opt.cursorline = true       -- Highlight the line the cursor is on
opt.number = true           -- Show the line number column in the gutter
opt.relativenumber = false  -- Use absolute numbers instead of relative (lines numbered from cursor)
opt.scrolloff = 8           -- Keep at least 8 lines visible above/below the cursor when scrolling
opt.showmode = true         -- Show the current mode (-- INSERT --) in the command line
opt.sidescrolloff = 8       -- Same as scrolloff, but for horizontal scrolling
opt.signcolumn = "yes"      -- Always reserve a gutter column for diagnostics/git signs (stops layout shifting)
opt.termguicolors = true    -- Enable 24-bit RGB colors in the terminal (required by most colorschemes)
opt.wrap = true             -- Visually wrap long lines instead of requiring horizontal scrolling

-- Indentation
opt.expandtab = true        -- Insert spaces when pressing <Tab> instead of a literal tab character
opt.shiftwidth = 4          -- Number of spaces used for each level of indentation (<<, >>, auto-indent)
opt.smartindent = true      -- Automatically indent new lines based on syntax (e.g. after `{`)
opt.tabstop = 4             -- Width (in spaces) that a tab character displays as

-- Search
opt.hlsearch = true         -- Highlight all matches of the last search
opt.ignorecase = true       -- Searches are case-insensitive by default
opt.incsearch = true        -- Highlight matches while typing the search pattern
opt.smartcase = true        -- ...unless the pattern contains an uppercase letter (then case-sensitive)

-- Editing
opt.breakindent = true    -- Wrapped lines keep the same indentation as the start of the line
opt.linebreak = true      -- Wrap lines at word boundaries instead of mid-word
opt.fixendofline = false  -- Don't automatically add a trailing newline at EOF when writing files
opt.swapfile = false      -- Disable swap files (undo is handled separately; avoids .swp clutter)
opt.undofile = false      -- Disable persistent undo (undo history is lost when the buffer closes)
opt.confirm = false       -- Don't auto-prompt "Save changes?" on quit; alert-style prompts still appear
