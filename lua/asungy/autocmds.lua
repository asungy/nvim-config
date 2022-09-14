-- Update buffer if changed outside of neovim session
vim.cmd[[
    autocmd FocusGained,BufEnter * :checktime
]]

-- Turn off line numbers in terminal
vim.cmd[[
    autocmd TermOpen * setlocal nonumber norelativenumber
]]

-- Do not show [Process exited] after closing terminal
-- Reference: https://github.com/samjwill/dotfiles/blob/master/.config/nvim/init.vim
vim.cmd[[
    autocmd TermClose * execute 'bdelete! ' . expand('<abuf>')
]]
