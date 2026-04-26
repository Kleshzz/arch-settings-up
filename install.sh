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
copy "$HOME/.config/hypr"  "$DOTFILES/hyprland/.config/hypr" "hyprlock.conf"

# Zsh плагины
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone --depth=1 --single-branch \
        https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo "Done zsh-autosuggestions"
else
    echo "Skip zsh-autosuggestions (already installed)"
fi

# Zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone --depth=1 --single-branch \
        https://github.com/zsh-users/zsh-syntax-highlighting \
        "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
    echo "Done zsh-syntax-highlighting"
else
    echo "Skip zsh-syntax-highlighting (already installed)"
fi

# Zoxide
if ! command -v zoxide &>/dev/null; then
    sudo pacman -S --needed --noconfirm zoxide
    echo "Done zoxide"
else
    echo "Skip zoxide (already installed)"
fi

mkdir -p "$HOME/Pictures/Screenshots"

# Зависимости для update
sudo pacman -S --needed --noconfirm pacman-contrib

# Установка update
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
    echo "alias fresh='/usr/local/bin/update'" >> "$HOME/.zshrc"

echo "Done update"

echo "All done!"