#!/bin/bash
set -e

if command -v yay &>/dev/null; then
    yay -Syu --noconfirm --removemake --combinedupgrade --batchinstall || true
    yay -Sc --noconfirm 2>/dev/null || true
elif command -v paru &>/dev/null; then
    paru -Syu --noconfirm --removemake --combinedupgrade --batchinstall || true
    paru -Sc --noconfirm 2>/dev/null || true
else
    sudo pacman -Syu --noconfirm
fi

sudo paccache -rk1
sudo paccache -ruk0

sudo journalctl --rotate 2>/dev/null || true
sudo journalctl --vacuum-time=2weeks --vacuum-size=300M

sudo fstrim -av --quiet-unsupported

find "$HOME/.cache" -type f -atime +30 -delete 2>/dev/null || true
find "$HOME/.cache" -type d -empty -delete 2>/dev/null || true
echo "Old cache cleared"

find "$HOME/.local" -xtype l -delete 2>/dev/null || true
find "$HOME/.config" -xtype l -delete 2>/dev/null || true
echo "Broken symlinks cleared"

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

if command -v cargo &>/dev/null; then
    cargo cache --autoclean 2>/dev/null || rm -rf "$HOME/.cargo/registry/cache" 2>/dev/null || true
    echo "Cargo cache cleared"
fi

if command -v npm &>/dev/null; then
    npm cache clean --force 2>/dev/null || true
    echo "Npm cache cleared"
fi

if [ -d "$HOME/go/pkg/mod/cache" ]; then
    go clean -modcache 2>/dev/null || true
    echo "Go mod cache cleared"
fi

if command -v pip &>/dev/null; then
    pip cache purge 2>/dev/null || true
    echo "Pip cache cleared"
fi
if command -v uv &>/dev/null; then
    uv cache clean 2>/dev/null || true
    echo "Uv cache cleared"
fi

free_human=$(df -h /home | awk 'NR==2{print $4}')

if command -v notify-send &>/dev/null; then
    notify-send "🧹 Fresh done" "Free space: ${free_human}" --urgency=low
fi

echo ""
echo "Free space: ${free_human}"
echo "All done!"