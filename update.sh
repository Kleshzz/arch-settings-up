#!/bin/bash
set -e

sudo pacman -Syu --noconfirm

sudo paccache -r

orphans=$(pacman -Qdtq 2>/dev/null)
if [ -n "$orphans" ]; then
  echo "$orphans" | sudo pacman -Rns - --noconfirm
else
  echo "Not found!"
fi

echo "Done"
