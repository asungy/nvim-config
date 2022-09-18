-- Update buffer if changed outside of neovim session
vim.cmd[[
    autocmd FocusGained,BufEnter * :checktime
]]

-- Turn off line numbers in terminal
vim.cmd[[
    autocmd TermOpen * setlocal nonumber norelativenumber
]]
