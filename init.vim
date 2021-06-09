"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourced files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.config/nvim/plugins/vimplug.vim
source $HOME/.config/nvim/themes/theme.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display absolute number lines
set number

" Display relative number lines
set relativenumber

" Do not highlight searches
set nohlsearch

" 10 line buffer for cursor from top and bottom of screen
set scrolloff=10

" Set wildmenu for displaying command completion
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set tabs to 4 spaces
set tabstop=4

" Set shiftwidth to 4 spaces
set shiftwidth=4

" Set tab key to use spaces
set expandtab

" Auto-indent
set autoindent

" Specific filetype settings
"
" To list available filetypes type `:setfiletype ` (note the space), then
" press `Ctrl-d`.
autocmd Filetype vim    setlocal tabstop=2 shiftwidth=2 expandtab

" Set detection for unknown file extensions
augroup filetypedetect
  autocmd BufNew,BufRead,BufNewFile *.dockerfile set filetype=dockerfile
  autocmd BufNew,BufRead,BufNewFile *.asm        set filetype=asm
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Join current line with one above it
nnoremap <S-k> k<S-j>

" Insert newline in normal mode under cursor
nnoremap <Return> o<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Navigate between split windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Navigate through tabs
nnoremap <S-l> gt
nnoremap <S-h> gT

" Change two horizontally split windows to vertical split
nnoremap <C-w>v <C-w>t<C-w>H

" Resizing split screens more easily
" Use <C-w>= to make windows equidistant
nnoremap + <C-w>>
nnoremap - <C-w><

" Quick access for NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "

" Open nvim-config directory
nnoremap <leader>vc :edit ~/.config/nvim<cr>

" Re-source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Vertical window splitting
nnoremap <leader>vs :vsplit<cr>
