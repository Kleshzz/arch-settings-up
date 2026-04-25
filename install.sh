#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "Need no root!"
    exit 1
fi

REPO="$(cd "$(dirname "$0")" && pwd)"
DOTFILES="$REPO/dotfiles"

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

# Зависимости для update
sudo pacman -S --needed --noconfirm pacman-contrib

# Установка update
sudo cp "$REPO/update.sh" /usr/local/bin/update
sudo chmod +x /usr/local/bin/update

# Sudoers
user="$(whoami)"
sudoers_file="/etc/sudoers.d/update-${user}"
sudoers_line="${user} ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/paccache"
sudo grep -qF "$sudoers_line" "$sudoers_file" 2>/dev/null || {
    echo "$sudoers_line" | sudo tee "$sudoers_file" > /dev/null
    sudo chmod 440 "$sudoers_file"
}

# Алиас в .zshrc
grep -q "alias update=" "$HOME/.zshrc" 2>/dev/null || \
    echo "alias update='/usr/local/bin/update'" >> "$HOME/.zshrc"

echo "Done update"

echo "All done!"