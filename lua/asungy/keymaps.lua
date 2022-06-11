local keymap = vim.api.nvim_set_keymap
local opts = {
    noremap = true, -- no recursive mapping
    silent  = true  -- do not echo mapping in command line
}
local nvim_dir = os.getenv("HOME") .. "/.config/nvim"
local command

-------------------------------------------------------------------------------
-- Editing
-------------------------------------------------------------------------------

-- Join current line with one above it
keymap("n", "<S-k>", "k<S-j>", opts)

-- Insert newline in normal mode under cursor
keymap("n", "<Return>", "o<esc>", opts)

-- Stay in indent-mode when indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down in visual mode
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Move text up and down in visual block mode
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-------------------------------------------------------------------------------
-- Windowing
-------------------------------------------------------------------------------

-- Better navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resizing
-- Use <C-w>= to make windows equidistant
keymap("n", "<C-Up>",    ":resize +2<CR>", opts)
keymap("n", "<C-Down>",  ":resize -2<CR>", opts)
keymap("n", "<C-Left>",  ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate through tabs
keymap("n", "<S-l>", "gt", opts)
keymap("n", "<S-h>", "gT", opts)

-------------------------------------------------------------------------------
-- Leader key mappings
-------------------------------------------------------------------------------

-- Set leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Open neovim configuration repo
command = ":edit " .. nvim_dir .. "<CR>"
keymap("n", "<leader>cf", command, opts)

-- Vertical window split
keymap("n", "<leader>vs", ":vsplit .<CR>", opts)

-- New tab
keymap("n", "<leader>nt", ":tabnew<CR>", opts)
