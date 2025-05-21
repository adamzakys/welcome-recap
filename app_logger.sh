#!/bin/bash

LOGFILE="$HOME/.welcome_recap/log_apps.txt"

while true; do
    # Ambil info window aktif via hyprctl (Hyprland)
    active_win=$(hyprctl activewindow -j | jq -r '.title + " | " + .class')

    # Simpan timestamp dan nama aplikasi/window ke log file
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $active_win" >> "$LOGFILE"

    # Simpan hanya 1000 baris terakhir biar gak membengkak
    tail -n 1000 "$LOGFILE" > "${LOGFILE}.tmp" && mv "${LOGFILE}.tmp" "$LOGFILE"

    sleep 60
done
