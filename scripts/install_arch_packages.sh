#!/bin/bash

main() {
    sudo pacman -Syu \
        cloc \
        docker \
        docker-compose \
        filelight \
        git-delta \
        ibus \
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
