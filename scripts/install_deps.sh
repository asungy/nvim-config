#!/bin/bash

# Run as `sudo`

main() {
    # Install APT packages
    apt update && \
    apt install -y \
        ccls \
        git \
        gopls \
        ripgrep \
    && echo "Installed apt packages"

    # Install FZF
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install

    # Install FiraCode NerdFont
    git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerdfont
    /tmp/nerdfont/install.sh FiraCode
}

main "$@" || exit 1
