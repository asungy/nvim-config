#!/bin/bash

# Run as `sudo`

main() {
    apt update
    apt install -y ccls
}

main "$@" || exit 1
