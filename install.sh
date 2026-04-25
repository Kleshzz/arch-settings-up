#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "Need no root!"
    exit 1
fi

DOTFILES="$(cd "$(dirname "$0")" && pwd)/dotfiles"

backup() {
    [ -f "$1" ] && cp "$1" "$1.bak.$(date +%Y%m%d_%H%M%S)"
}

copy() {
    mkdir -p "$1"
    backup "$1/$3"
    cp "$2/$3" "$1/$3"
    echo "Done $3"
}

copy "$HOME"               "$DOTFILES/zsh"                    ".zshrc"
copy "$HOME/.config/kitty" "$DOTFILES/kitty/.config/kitty"   "kitty.conf"
copy "$HOME/.config/rofi"  "$DOTFILES/rofi/.config/rofi"     "config.rasi"
copy "$HOME/.config/hypr"  "$DOTFILES/hyprland/.config/hypr" "hyprland.conf"

echo "All done!"