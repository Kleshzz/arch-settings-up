#!/bin/bash
set -e

if command -v yay &>/dev/null; then
    yay -Syu --noconfirm --removemake
elif command -v paru &>/dev/null; then
    paru -Syu --noconfirm --removemake
else
    sudo pacman -Syu --noconfirm
fi

sudo paccache -rk2
sudo paccache -ruk0

sudo journalctl --vacuum-time=2weeks --vacuum-size=500M

sudo fstrim -av

orphans=$(pacman -Qdtq 2>/dev/null || true)
if [ -n "$orphans" ]; then
    echo "$orphans" | sudo pacman -Rns - --noconfirm
else
    echo "Unused weren't found!"
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    ZSH="$HOME/.oh-my-zsh" zsh -c 'source $ZSH/oh-my-zsh.sh && omz update --unattended' 2>/dev/null || true
fi