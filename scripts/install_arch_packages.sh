#!/bin/bash

main() {
    sudo pacman -Syu \
        cloc \
        docker \
        docker-compose \
        git-delta \
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
