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
autocmd Filetype asm                setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype wast               setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype html               setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype css                setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript         setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescript         setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype typescriptreact    setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype json               setlocal tabstop=2 shiftwidth=2 expandtab
" Hint - `gq` reformats selected text
autocmd Filetype markdown           setlocal tabstop=2 shiftwidth=2 expandtab textwidth=80
autocmd Filetype markdown.mdx       setlocal tabstop=2 shiftwidth=2 expandtab textwidth=80
autocmd Filetype nasm               setlocal tabstop=2 shiftwidth=2 expandtab
autocmd Filetype vim                setlocal tabstop=2 shiftwidth=2 expandtab

" Set detection for unknown file extensions
augroup filetypedetect
  autocmd BufNew,BufRead,BufNewFile *.dockerfile set filetype=dockerfile
  autocmd BufNew,BufRead,BufNewFile *.asm        set filetype=nasm
  autocmd BufNew,BufRead,BufNewFile *.cls        set filetype=tex
augroup END

" Auto-commenting
autocmd FileType tex setlocal formatoptions+=c formatoptions+=r formatoptions+=o 
                            \ comments+=:%

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
nnoremap <leader>cf :edit ~/.config/nvim<cr>

" Re-source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" Vertical window splitting
nnoremap <leader>vs :vsplit<cr>

" New tab
nnoremap <leader>nt :tabnew<cr>

" Toggle window maximization
nnoremap <leader>mt :MaximizerToggle!<cr>

" Colorschemes
nnoremap <leader>co :Colors<cr>

" FZF
nnoremap <leader>fi :Files<cr>
nnoremap <leader>gi :GFiles<cr>
nnoremap <leader>rg :Rg<cr>

