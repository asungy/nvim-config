""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install Vim Plug automatically
" (if fails, make sure curl is installed)
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Better syntax support
Plug 'sheerun/vim-polyglot'

" Dark theme for neovim
Plug 'joshdick/onedark.vim'

" Fuzzy finder makes it easier to navigate through files in a project
" GFiles command needs RipGrep installed on system
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'


" Auto-closing for '(', '{', '['
Plug 'jiangmiao/auto-pairs'


" Basically Intellisense for Vim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
