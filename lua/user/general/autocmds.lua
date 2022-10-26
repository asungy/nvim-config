-- Update buffer if changed outside of neovim session
vim.cmd[[
    autocmd FocusGained,BufEnter * :checktime
]]

-- Turn off line numbers in terminal
vim.cmd[[
    autocmd TermOpen * setlocal nonumber norelativenumber
]]

-- Turn off smartindent for Dart files. Entering a new line with autopairs
-- causes the closing pair to be unexpectedly indented.
-- vim.cmd[[
--     autocmd FileType dart set nosmartindent
-- ]]

-- Set tab spacing for Dart files.
vim.cmd[[
    autocmd FileType dart setlocal tabstop=2 shiftwidth=2 expandtab
]]
