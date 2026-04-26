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