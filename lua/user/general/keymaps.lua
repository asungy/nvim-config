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
--keymap("n", "<Return>", "o<esc>", opts)
--vim.cmd [[
--    autocmd! CmdwinEnter [\/\?\:] nunmap <Return>
--    autocmd! CmdwinLeave [\/\?\:] nnoremap <Return> o<esc>
--]]

-- Stay in indent-mode when indenting in visual mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down in visual mode
keymap("v", "<A-j>", "<CMD>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<CMD>m .-2<CR>==", opts)

-- Move text up and down in visual block mode
keymap("x", "<A-j>", "<CMD>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<CMD>move '<-2<CR>gv-gv", opts)

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
keymap("n", "<C-Up>",    "<CMD>resize +2<CR>", opts)
keymap("n", "<C-Down>",  "<CMD>resize -2<CR>", opts)
keymap("n", "<C-Left>",  "<CMD>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

-- Navigate through tabs
keymap("n", "<S-l>", "gt", opts)
keymap("n", "<S-h>", "gT", opts)

-------------------------------------------------------------------------------
-- Misc
-------------------------------------------------------------------------------

-- Open file explorer
keymap("n", "<C-n>", "<CMD>NvimTreeToggle<CR>", opts)

-- ToggleTerm normal mode
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
keymap("t", "<C-q>", "<Esc>", opts)
-------------------------------------------------------------------------------
-- Leader key mappings
-------------------------------------------------------------------------------

-- Set leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Open neovim configuration repo
command = "<CMD>edit " .. nvim_dir .. "<CR>"
keymap("n", "<leader>cf", command, opts)

-- Vertical window split
keymap("n", "<leader>vs", "<CMD>vsplit<CR>", opts)

-- New tab
keymap("n", "<leader>nt", "<CMD>tabnew<CR>", opts)

-- New buffer (to be tracked by Dashboard)
-- keymap("n", "<leader>nb", "<CMD>DashboardNewFile<CR>", opts)

-- Toggle window maximization
keymap("n", "<leader>mt", "<CMD>MaximizerToggle!<CR>", opts)

-- Open terminal
keymap("n", "<leader>tr", "<CMD>terminal<CR>", opts)

-- Telescope
keymap("n", "<leader>bl", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>ch", "<CMD>Telescope command_history<CR>", opts)
keymap("n", "<leader>cs", "<CMD>Telescope colorscheme<CR>", opts)
keymap("n", "<leader>fb", "<CMD>Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", "<CMD>Telescope commands<CR>", opts)
keymap("n", "<leader>fi", "<CMD>lua require 'telescope.builtin'.find_files{hidden=true, no_ignore=true}<CR>", opts)
keymap("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", opts)
keymap("n", "<leader>fm", "<CMD>Telescope marks<CR>", opts)
keymap("n", "<leader>fr", "<CMD>Telescope registers<CR>", opts)
keymap("n", "<leader>gc", "<CMD>Telescope git_commits<CR>", opts)
keymap("n", "<leader>gi", "<CMD>Telescope git_files<CR>", opts)
keymap("n", "<leader>gs", "<CMD>Telescope grep_string<CR>", opts)
keymap("n", "<leader>ht", "<CMD>Telescope help_tags<CR>", opts)
keymap("n", "<leader>jl", "<CMD>Telescope jumplist<CR>", opts)
keymap("n", "<leader>lg", "<CMD>Telescope live_grep<CR>", opts)

-- Hop
keymap("", "s", "<CMD>HopWordMW<CR>", opts)
keymap("", "S", "<CMD>HopChar1MW<CR>", opts)
