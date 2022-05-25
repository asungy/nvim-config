" Auto-install Vim Plug
" (ensure curl is installed)
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " File explorer
  Plug 'preservim/nerdtree'

  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " Syntax language pack
  Plug 'sheerun/vim-polyglot'

  " Allows nvim to quickly maximize/un-maximize window
  Plug 'szw/vim-maximizer'

  " Color themes
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'asungy/molokai'
  Plug 'joshdick/onedark.vim'
  Plug 'mhartington/oceanic-next'
  Plug 'kyoz/purify', { 'rtp': 'vim' }

  " Auto close brackets, parentheses, and quotes
  Plug 'jiangmiao/auto-pairs'

  " Easily wrap text in parentheses, brackets, quotes, etc
  Plug 'tpope/vim-surround'

  " Quick commenting/uncommenting
  Plug 'tpope/vim-commentary'

  " Add smooth scrolling
  Plug 'psliwka/vim-smoothie'

call plug#end()
