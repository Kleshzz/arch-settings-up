#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "Need no root!"
    exit 1
fi

DOTFILES="$(cd "$(dirname "$0")" && pwd)/dotfiles"

save() {
    mkdir -p "$2"
    cp "$1/$3" "$2/$3"
    echo "Done $3"
}

save "$HOME"               "$DOTFILES/zsh"                    ".zshrc"
save "$HOME/.config/kitty" "$DOTFILES/kitty/.config/kitty"   "kitty.conf"
save "$HOME/.config/rofi"  "$DOTFILES/rofi/.config/rofi"     "config.rasi"
save "$HOME/.config/hypr"  "$DOTFILES/hyprland/.config/hypr" "hyprland.conf"
save "$HOME/.config/hypr"  "$DOTFILES/hyprland/.config/hypr" "hyprlock.conf"

echo "All done!"