#!/bin/bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)/dotfiles"

# zsh
cp "$DOTFILES/zsh/.zshrc" ~/.zshrc
echo "Done zshrc!"

# kitty
mkdir -p ~/.config/kitty
cp "$DOTFILES/kitty/.config/kitty/kitty.conf" ~/.config/kitty/kitty.conf
echo "Done kitty.conf!"

# rofi
mkdir -p ~/.config/rofi
cp "$DOTFILES/rofi/.config/rofi/config.rasi" ~/.config/rofi/config.rasi
echo "Done rofi - config.rasi!"

# hyprland
mkdir -p ~/.config/hypr
cp "$DOTFILES/hyprland/.config/hypr/hyprland.conf" ~/.config/hypr/hyprland.conf
echo "Done hyprland.conf!"

echo "All done!"