#!/bin/bash

main() {
    # Install APT packages
    sudo apt update && \
    sudo apt install -y \
        build-essential \
        ripgrep \
        wl-clipboard \
    && echo "Installed apt packages"

    # Install FZF
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # Install FiraCode NerdFont
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerdfont
    /tmp/nerdfont/install.sh FiraCode
}

main "$@" || exit 1
