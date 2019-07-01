#!/bin/sh

set -e

PORTS=(
    fd
    fzf
    ripgrep
    tmux
    tree
)

for port in $PORTS; do
    sudo port install $port
done
