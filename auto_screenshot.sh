#!/bin/bash

# Folder penyimpanan
DIR="$HOME/.welcome_recap/screenshots"
mkdir -p "$DIR"

# Nama file berdasarkan waktu
FILENAME="screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

# Jalankan grim (khusus Wayland / Hyprland)
grim "$DIR/$FILENAME"
