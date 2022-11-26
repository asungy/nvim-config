-- Update buffer if changed outside of neovim session
vim.cmd[[
    autocmd FocusGained,BufEnter * :checktime
]]

-- Turn off line numbers in terminal
vim.cmd[[
    autocmd TermOpen * setlocal nonumber norelativenumber
]]

-- Set tab spacing for Dart files.
vim.cmd[[
    autocmd FileType dart setlocal tabstop=2 shiftwidth=2 expandtab
]]

-- Set tab spacing for TypeScript React
vim.cmd[[
    autocmd FileType typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab
]]
