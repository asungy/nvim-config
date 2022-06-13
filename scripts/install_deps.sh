#!/bin/bash

# Run as `sudo`

main() {
    # Install APT packages
    apt update
    apt install -y ccls gopls ripgrep

    # Install FZF
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}

main "$@" || exit 1
