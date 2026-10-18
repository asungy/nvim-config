-- Leader keys
vim.g.mapleader = " " -- Set <Space> as the leader key (prefix for custom keymaps, e.g. <Space>w)
vim.g.maplocalleader = "\\" -- Set <Backslash> as the local leader (prefix for buffer/plugin-local keymaps)

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch | update<CR>", { desc = "Clear search highlights and save if changed" })
map("n", "j", "gj", { desc = "Down (and through wrapped lines)" })
map("n", "k", "gk", { desc = "Up (and through wrapped lines)" })

-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Copy to clipboard
map("v", "<leader>y", '"+y', { desc = "Copy selection to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste selection to system clipboard" })
map("v", "<leader>p", '"+p', { desc = "Paste selection to system clipboard" })

-- Indent
map("v", ">", ">gv", { desc = "Indent and keep selection" })
map("v", "<", "<gv", { desc = "Deindent and keep selection" })
