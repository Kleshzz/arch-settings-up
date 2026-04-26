#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "Need no root!"
    exit 1
fi

DOTFILES="$(cd "$(dirname "$0")" && pwd)/dotfiles"

save() {
    local src="$1"
    local dst="$2"
    mkdir -p "$(dirname "$dst")"
    cp -p "$src" "$dst"
    echo "Done $(basename "$dst")"
}

save "$HOME/.zshrc"                      "$DOTFILES/.zshrc"
save "$HOME/.config/kitty/kitty.conf"    "$DOTFILES/.config/kitty/kitty.conf"
save "$HOME/.config/rofi/config.rasi"    "$DOTFILES/.config/rofi/config.rasi"
save "$HOME/.config/hypr/hyprland.conf"  "$DOTFILES/.config/hypr/hyprland.conf"
save "$HOME/.config/hypr/hyprlock.conf"  "$DOTFILES/.config/hypr/hyprlock.conf"
save "$HOME/.config/dunst/dunstrc"       "$DOTFILES/.config/dunst/dunstrc"
save "$HOME/.config/gamemode.ini"        "$DOTFILES/.config/gamemode.ini"
save "$HOME/.config/waybar/config.jsonc" "$DOTFILES/.config/waybar/config.jsonc"
save "$HOME/.config/waybar/style.css"    "$DOTFILES/.config/waybar/style.css"

echo "All done!"