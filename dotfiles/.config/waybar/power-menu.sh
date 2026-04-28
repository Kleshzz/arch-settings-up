#!/bin/bash

choice=$(printf "󰐥 Turn off\n󰜉 Reboot\n󰒲 Sleep" | rofi \
    -dmenu \
    -p "" \
    -no-show-match \
    -theme-str 'window {width: 200px; border-radius: 12px;}' \
    -theme-str 'listview {lines: 3;}' \
    -theme-str 'inputbar {enabled: false;}')

case "$choice" in
    "󰐥 Turn off") systemctl poweroff ;;
    "󰜉 Reboot") systemctl reboot ;;
    "󰒲 Sleep") hyprlock ;;
esac