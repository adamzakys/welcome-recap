🖥️ Welcome Recap — Terminal Login Recap Screenshot
Skrip terminal sederhana yang menampilkan rekap aktivitas desktop setiap kali kamu membuka terminal (zsh/bash), termasuk:

Nama aplikasi yang sedang terbuka

Screenshot terbaru dari desktop kamu

Perintah terakhir di terminal

Dukungan tampilan gambar langsung dalam terminal seperti kitty atau wezterm

✨ Fitur
⏱️ Logger aplikasi aktif tiap 10 menit (app_logger.sh)

📸 Screenshot otomatis desktop tiap 10 menit (auto_screenshot.sh)

📋 Rekap langsung muncul saat buka terminal (recap.sh)

🖼️ Mendukung terminal kitty/wezterm untuk preview gambar

📄 Cronjob otomatis saat instalasi

🖼️ Preview
Kalau kamu pakai terminal kitty, nanti tampilannya bakal kayak gini:

📦 Instalasi
1. Clone repository-nya
git clone https://github.com/adamzakys/welcome-recap.git ~/.welcome_recap
cd ~/.welcome_recap

2. Instal aplikasi yang dibutuhkan
Minimal kamu butuh:

xdotool → buat deteksi aplikasi yang aktif

gnome-screenshot → buat ambil screenshot (kalau kamu pakai Wayland, bisa pakai grim)

Terminal yang support gambar kayak kitty atau wezterm

Kalau kamu pakai Ubuntu/Debian:

sudo apt update
sudo apt install xdotool gnome-screenshot

Kalau kamu pakai Arch/Manjaro:

sudo pacman -S xdotool gnome-screenshot

3. Langsung instal skripnya
bash install.sh

Yang bakal dilakukan:

Nambah cronjob biar auto_screenshot.sh & app_logger.sh jalan otomatis tiap 10 menit

Masukin pemanggilan recap.sh ke .zshrc atau .bashrc, jadi tiap buka terminal langsung tampil

❌ Uninstall
Gampang banget bro:

bash uninstall.sh

Yang bakal dihapus:

Cronjob otomatis

Folder ~/.welcome_recap beserta isinya

Baris script recap.sh dari .zshrc atau .bashrc

⚙️ Catatan Tambahan
Gambar cuma tampil kalau terminal kamu support (kitty, wezterm)

Screenshot bakal disimpan di:

~/.welcome_recap/screenshots/

Log aplikasi disimpan di:

~/.welcome_recap/log_apps.txt
