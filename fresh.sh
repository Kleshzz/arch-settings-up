#!/bin/bash
set -e

if command -v yay &>/dev/null; then
    yay -Syu --noconfirm --removemake --combinedupgrade --batchinstall
elif command -v paru &>/dev/null; then
    paru -Syu --noconfirm --removemake --combinedupgrade --batchinstall
else
    sudo pacman -Syu --noconfirm
fi

sudo paccache -rk2
sudo paccache -ruk0

sudo journalctl --vacuum-time=2weeks --vacuum-size=500M

sudo fstrim -av

find "$HOME/.cache" -type f -atime +30 -delete 2>/dev/null || true
echo "Old cache cleared"

find "$HOME/.local" -xtype l -delete 2>/dev/null || true
echo "Broken symlinks cleared"

find "$HOME/.local/share/recently-used.xbel" -type f -exec truncate -s 0 {} \; 2>/dev/null || true
find "$HOME/.local/share/applications/" -name "*.desktop" -xtype l -delete 2>/dev/null || true

sudo systemd-tmpfiles --clean 2>/dev/null || true
sudo coredumpctl clean 2>/dev/null || true
echo "Coredumps cleared"

if [ -d "$HOME/.local/share/Trash" ]; then
    rm -rf "$HOME/.local/share/Trash/files/"*
    rm -rf "$HOME/.local/share/Trash/info/"*
    echo "Trash cleared"
fi

orphans=$(pacman -Qdtq 2>/dev/null || true)
if [ -n "$orphans" ]; then
    echo "$orphans" | sudo pacman -Rns --noconfirm -
else
    echo "Unused weren't found!"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    ZSH="$HOME/.oh-my-zsh" zsh -c 'source $ZSH/oh-my-zsh.sh && omz update --unattended' 2>/dev/null || true
fi

freed=$(df -h / | awk 'NR==2{print $4}')
if command -v notify-send &>/dev/null; then
    notify-send "🧹 Fresh done" "System cleaned\nFreed space: $freed" --urgency=low
fi

echo "All done! Freed: $freed"