#!/bin/bash

DEST="$HOME/.welcome_recap"

echo "Installing Welcome Recap..."

# List dependencies yang dibutuhkan
DEPENDENCIES=(scrot xdotool cron)

# Fungsi cek dan install dependencies
install_deps() {
  for pkg in "${DEPENDENCIES[@]}"; do
    if ! command -v "$pkg" &>/dev/null; then
      echo "Installing missing dependency: $pkg"
      sudo apt-get update
      sudo apt-get install -y "$pkg"
    else
      echo "Dependency $pkg already installed."
    fi
  done
}

install_deps

# Buat folder tujuan
mkdir -p "$DEST/screenshots"

# Copy semua file .sh ke folder tujuan
cp *.sh "$DEST/"

# Copy folder screenshots jika ada (kalau kosong ga masalah)
cp -r screenshots/* "$DEST/screenshots/" 2>/dev/null

# Beri hak akses executable ke skrip
chmod +x "$DEST"/*.sh

# Tambahkan cronjob untuk auto screenshot tiap 10 menit (tanpa duplikasi)
(crontab -l 2>/dev/null | grep -v 'auto_screenshot.sh' ; echo "*/10 * * * * $DEST/auto_screenshot.sh") | crontab -

echo "Installation complete!"
echo "You can run the recap anytime by executing:"
echo "$DEST/recap.sh"
