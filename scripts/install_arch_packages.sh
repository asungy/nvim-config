#!/bin/bash

main() {
    sudo pacman -Syu \
        docker \
        kde-system \
        kdeplasma-addons \
        keepassxc \
        noto-fonts-cjk \
        noto-fonts-emoji \
    && :

    yay -S \
        brave-bin \
        dropbox \
    && :
}

main "$@" || exit 1
