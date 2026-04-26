#!/bin/bash
set -e

if [ "$EUID" -eq 0 ]; then
    echo "Need no root!"
    exit 1
fi

REPO="$(cd "$(dirname "$0")" && pwd)"
DOTFILES="$REPO/dotfiles"

backup() {
    [ -f "$1" ] && cp "$1" "$1.bkp"
}

install_file() {
    local src="$1"
    local dst="$2"
    mkdir -p "$(dirname "$dst")"
    backup "$dst"
    cp "$src" "$dst"
    echo "Done $(basename "$dst")"
}

install_file "$DOTFILES/.zshrc"                         "$HOME/.zshrc"
install_file "$DOTFILES/.config/kitty/kitty.conf"       "$HOME/.config/kitty/kitty.conf"
install_file "$DOTFILES/.config/rofi/config.rasi"       "$HOME/.config/rofi/config.rasi"
install_file "$DOTFILES/.config/hypr/hyprland.conf"     "$HOME/.config/hypr/hyprland.conf"
install_file "$DOTFILES/.config/hypr/hyprlock.conf"     "$HOME/.config/hypr/hyprlock.conf"
install_file "$DOTFILES/.config/dunst/dunstrc"          "$HOME/.config/dunst/dunstrc"
install_file "$DOTFILES/.config/gamemode.ini"           "$HOME/.config/gamemode.ini"
install_file "$DOTFILES/.config/waybar/config.jsonc"    "$HOME/.config/waybar/config.jsonc"
install_file "$DOTFILES/.config/waybar/style.css"       "$HOME/.config/waybar/style.css"

# Zsh плагины
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone --depth=1 --single-branch \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo "Done zsh-autosuggestions"
else
    echo "Skip zsh-autosuggestions (already installed)"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone --depth=1 --single-branch \
        https://github.com/zsh-users/zsh-syntax-highlighting \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    echo "Done zsh-syntax-highlighting"
else
    echo "Skip zsh-syntax-highlighting (already installed)"
fi

# Пакеты
if ! command -v zoxide &>/dev/null; then
    sudo pacman -S --needed --noconfirm zoxide
    echo "Done zoxide"
else
    echo "Skip zoxide (already installed)"
fi

if ! command -v gamemoded &>/dev/null; then
    sudo pacman -S --needed --noconfirm gamemode lib32-gamemode
    echo "Done gamemode"
else
    echo "Skip gamemode (already installed)"
fi

if ! command -v dunst &>/dev/null; then
    sudo pacman -S --needed --noconfirm dunst libnotify
    echo "Done dunst"
else
    echo "Skip dunst (already installed)"
fi

mkdir -p "$HOME/Pictures/Screenshots"

# Зависимости для fresh
sudo pacman -S --needed --noconfirm pacman-contrib

# Установка fresh
sudo cp "$REPO/fresh.sh" /usr/local/bin/fresh
sudo chmod +x /usr/local/bin/fresh

# Sudoers
user="$(whoami)"
sudoers_file="/etc/sudoers.d/update-${user}"
sudoers_line="${user} ALL=(ALL) NOPASSWD: /usr/bin/pacman, /usr/bin/paccache, /usr/bin/journalctl, /usr/bin/fstrim"
sudo grep -qF "$sudoers_line" "$sudoers_file" 2>/dev/null || {
    echo "$sudoers_line" | sudo tee "$sudoers_file" > /dev/null
    sudo chmod 440 "$sudoers_file"
}

# Алиас в .zshrc
grep -q "alias fresh=" "$HOME/.zshrc" 2>/dev/null || \
    echo "alias fresh='/usr/local/bin/fresh'" >> "$HOME/.zshrc"

echo "Done fresh"
echo "All done!"