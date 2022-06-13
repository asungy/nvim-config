#!/bin/bash

# Run as `sudo`

main() {
    apt update
    apt install -y ccls gopls
}

main "$@" || exit 1
