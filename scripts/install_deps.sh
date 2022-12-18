#!/bin/bash

main() {
    # Install Pacman packages
    sudo pacman -Syu \
    && sudo pacman -Syu \
        ripgrep \
        wl-clipboard \
        xclip \
    && :

    # Install FZF
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # Install FiraCode NerdFont
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerdfont
    /tmp/nerdfont/install.sh FiraCode
}

main "$@" || exit 1
