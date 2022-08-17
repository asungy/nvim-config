vim.cmd[[
    autocmd FocusGained,BufEnter * :checktime
]]

vim.cmd[[
    autocmd DirChanged cwd :NERDTreeCWD
]]
