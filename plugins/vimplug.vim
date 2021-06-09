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

  " Syntax language pack
  Plug 'sheerun/vim-polyglot'

  " Color themes
  Plug 'morhetz/gruvbox'
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'tomasr/molokai'
  Plug 'joshdick/onedark.vim'

call plug#end()
