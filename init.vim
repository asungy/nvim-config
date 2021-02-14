""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourced files
""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/colors/colors.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Display absolute and relative number lines
set nu
set rnu

" Do not wrap text
" set nowrap

" Set no highlight
set nohls

" A tab is equivalent to 4 spaces
set tabstop=4

" Set default shiftwidth=4
set shiftwidth=4

" Set tab key to use spaces
set expandtab

" Set auto indent
set autoindent

" Specific filetype settings
autocmd Filetype css             setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html            setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript      setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype markdown        setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype rust            setlocal tabstop=4 shiftwidth=4 expandtab
autocmd Filetype typescript      setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype vim             setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype yaml            setlocal tabstop=2 shiftwidth=2 expandtab

" Source: https://vim.fandom.com/wiki/Forcing_Syntax_Coloring_for_files_with_odd_extensions
augroup filetypedetect
  " au BufRead,BufNewFile *.tsx        set filetype=typescript
  au BufRead,BufNewFile *.dockerfile set filetype=dockerfile
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Join current line with one above it
nnoremap <S-k> k<S-j>

" Enter newline in normal mode
nnoremap <Return> o<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 10 lines to the cursor when moving vertically using j/k
set so=10

" Set wildmenu for displaying command completion
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows, and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""

" Move between windows more easily
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Navigate through tabs more easily
nnoremap <S-l> gt 
nnoremap <S-h> gT 

" Change two horizontally split windows to vertical split
" Useful when pulling up the 'help' page
nnoremap <C-w>v <C-w>t<C-w>H

" Resizing split screens more easily
" Use <C-w>= to make windows equidistant
nnoremap + <C-w>>
nnoremap _ <C-w><

nnoremap <C-n> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key commands
""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "-"

" Open up VIMRC
nnoremap <leader>ev :edit $MYVIMRC<cr>

" Source VIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Open up notes
nnoremap <leader>en :edit ~/.config/nvim/notes<cr>

" Open NERDTree in current window
nnoremap <leader>ed :edit .<cr>

" GFiles
nnoremap <leader>fi :GFiles<cr>

" RipGrep
nnoremap <leader>rg :Rg<cr>

" BLines
nnoremap <leader>bl :BLines<cr>

" New tab
nnoremap <leader>tn :tabnew<cr>

" Vertical split
nnoremap <leader>vs :vsplit<cr>

" Change directory to parent directory of current file
nnoremap <leader>cd :cd %:p:h<cr>
